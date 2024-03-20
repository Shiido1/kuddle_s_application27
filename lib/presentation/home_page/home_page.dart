import 'package:cloudinary/cloudinary.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuddle_s_application27/pages/home/model/property_list_model/property_model.dart';
import 'package:kuddle_s_application27/pages/home/model/services_list_model/services_model.dart';
import 'package:kuddle_s_application27/presentation/favorite_one_screen/favorite_one_screen.dart';
import 'package:kuddle_s_application27/presentation/favorite_page/favourite_tab.dart';
import 'package:kuddle_s_application27/presentation/home_page/hotel_detail.dart';
import 'package:kuddle_s_application27/presentation/home_page/service_detail.dart';
import 'package:kuddle_s_application27/presentation/home_page/tour_detail.dart';
import 'package:kuddle_s_application27/presentation/home_page/vehicle_detail.dart';
import 'package:kuddle_s_application27/presentation/home_page/widgets/flightsection_item_widget.dart';
import 'package:kuddle_s_application27/presentation/home_page/widgets/homesection_item_widget.dart';
import 'package:kuddle_s_application27/presentation/home_page/widgets/servicesection_item_widget.dart';
import 'package:kuddle_s_application27/presentation/home_page/widgets/toursection_item_widget.dart';
import 'package:kuddle_s_application27/presentation/home_page/widgets/vehiclesection_item_widget.dart';
import 'package:kuddle_s_application27/presentation/last_book_tab_container_page/last_book_tab_container_page.dart';
import 'package:kuddle_s_application27/presentation/last_book_tab_container_page/search_in_progress.dart';
import 'package:kuddle_s_application27/presentation/last_book_tab_container_page/searches_page.dart';
import 'package:kuddle_s_application27/presentation/profile_one_page/profile_one_page.dart';
import 'package:kuddle_s_application27/presentation/profile_screen/profile_screen.dart';
import 'package:kuddle_s_application27/presentation/search_filter_one_page/search_filter_one_page.dart';
import 'package:kuddle_s_application27/presentation/search_two_page/search_two_page.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

import '../../main_core/session_manager.dart';
import '../../pages/bookings/model/user_detail_model.dart';
import '../../pages/home/model/flight_list_model/flight_model.dart';
import '../../pages/home/model/tour_list_model/tour_model.dart';
import '../../pages/home/model/vehicle_list_model/vehicle_model.dart';
import '../../services/provider/provider_services.dart';
import '../../widgets/custom_bottom_app_bar.dart';
import '../car_page/widgets/car_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_subtitle.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_search_view.dart';
import 'flight_detail.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  final selectedIndex;
  HomePage({Key? key, required this.selectedIndex})
      : super(
          key: key,
        );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  int selectedChipIndex = 0;
  int _currentIndexx = 0;
  String? finalUrl = ImageConstant.imgEllipse12;

  getAuthUserID() async {
    String? userID = SessionManager.instance.authUserID;
    return userID;
  }

  ProviderServices? providerServices;
  UserInfo? userInfo;
  late final String avatarImagePath;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    Future.delayed(Duration.zero, () {
      FocusManager.instance.primaryFocus?.unfocus();
    });
    providerServices?.getAllPropertiesList();
    providerServices?.getAllVehiclesList();
    providerServices?.getAllFlightsList();
    providerServices?.getAllToursList();
    providerServices?.getAllServicesList();
    providerServices?.getUserDetails();

    for (var i = 0; i < bottomMenuList.length; i++) {
      bottomMenuList[i].isSelected = (i == widget.selectedIndex);
    }
    _currentIndexx = widget.selectedIndex ?? 0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    setState(() {
      providerServices?.userData?.result.first.avatar;
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    searchController.dispose(); // Dispose of searchController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: buildBottomNavigationBar(),
        body: Consumer<ProviderServices>(
          builder: (_, provider, __) {
            if (provider.propertyListModel == null ||
                provider.propertyListModel!.result!.isEmpty) {
              return Center(child: const CircularProgressIndicator());
            } else {
              return IndexedStack(index: _currentIndexx, children: [
                Scaffold(
                  appBar: _buildAppBarBasedOnSelectedWidget(provider),
                  body: SingleChildScrollView(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          _buildContenBasedOnSelectedWidget(),
                          _buildHotel(context),
                          SizedBox(
                            width: mediaQueryData.size.width,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 42.v),
                                  _buildContentBasedOnSelectedWidget(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // first page

                FavoritePageTab(),

                LastBookTabContainerPage(),

                ProfileOnePage()
              ]);
            }
          },
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(
      BuildContext context, ProviderServices provider) {
    if (provider.userData?.status != "Success") {
      return CustomAppBar(
        // You can add any loading indicator or default AppBar if userData status is not success
        // For example: AppBar(title: Text('Loading...'))
        leading: Container(), // placeholder leading
        actions: [Container()], // placeholder actions
      );
    }

    UserInfo userInfo = provider.userData!.result.first!;

    return CustomAppBar(
      // leadingWidth: 0.h,
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: AppbarTrailingCircleimage(
          imagePath: provider.userData!.result.first.avatar,
          margin: EdgeInsets.only(
            left: 11.h,
            top: 1.v,
            right: 4.h,
          ),
        ),
      ),
      title: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          AppbarSubtitle(
            text: "Hi, ${userInfo.firstName}",
            margin: EdgeInsets.fromLTRB(2.h, 14.v, 1.h, 17.v),
          ),
        ],
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Handle notification icon tap
            },
          ),
        ),
      ],
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar2(
      BuildContext context, ProviderServices provider) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgMenu,
        margin: EdgeInsets.only(
          left: 15.h,
          top: 19.v,
          bottom: 18.v,
        ),
      ),
      actions: [
        AppbarSubtitle(
          text: "",
          margin: EdgeInsets.fromLTRB(15.h, 14.v, 1.h, 17.v),
        ),
        AppbarTrailingCircleimage(
          imagePath: provider.userData!.result.first!.avatar,
          margin: EdgeInsets.only(
            left: 11.h,
            top: 1.v,
            right: 16.h,
          ),
        ),
      ],
    );
  }

  Widget _buildHotel(BuildContext context) {
    const double chipSpacing = 6.0; // Adjust the spacing as needed
    List<String> chipNames = [
      "Accomodation",
      "Cars",
      "Flights",
      "Tours",
      "Services"
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15.h),
      child: IntrinsicWidth(
        child: Row(
          children: List<Widget>.generate(
            5,
            (index) => Padding(
              padding: EdgeInsets.only(right: chipSpacing),
              child: RawChip(
                padding: EdgeInsets.symmetric(
                  horizontal: 19.h,
                  vertical: 10.v,
                ),
                showCheckmark: false,
                labelPadding: EdgeInsets.zero,
                label: Text(
                  chipNames[index], // Use the chip name from the list
                  style: TextStyle(
                    color: selectedChipIndex == index
                        ? Colors.white
                        : theme.colorScheme.primary,
                    fontSize: 14.fSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                selected: selectedChipIndex == index,
                backgroundColor: theme.colorScheme.onPrimaryContainer,
                // Set the selected color to green when the chip is selected
                selectedColor: Color(
                    0xff003B95), // Change this to your desired green color
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(18.h),
                ),
                onSelected: (value) {
                  setState(() {
                    selectedChipIndex = value ? index : -1;
                  });

                  // You can add any logic here that you want to execute when the chip is selected or unselected
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCarRental(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Car Rental",
            style: CustomTextStyles.titleLarge23,
          ),
          Padding(
            padding: EdgeInsets.only(top: 11.v),
            child: Text(
              "View All",
              style: CustomTextStyles.bodyMediumRegular_1,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCar(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 15.h),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 220.v,
            crossAxisCount: 3,
            mainAxisSpacing: 18.h,
            crossAxisSpacing: 18.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: 9,
          itemBuilder: (context, index) {
            return CarItemWidget();
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPopularHotelsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Popular Hotels", style: CustomTextStyles.titleLarge23),
        Padding(
          padding: EdgeInsets.only(top: 9.v, bottom: 2.v),
          child: GestureDetector(
            onTap: () {
              // Navigate to the search three page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchInProgress(
                          initialTabIndex: selectedChipIndex,
                        )),
              );
            },
            child:
                Text("View All", style: CustomTextStyles.bodyMediumRegular_1),
          ),
        )
      ]),
    );
  }

  /// Section Widget
  Widget _buildPopularHotelsSection2(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Car Rental", style: CustomTextStyles.titleLarge23),
        Padding(
          padding: EdgeInsets.only(top: 9.v, bottom: 2.v),
          child: GestureDetector(
            onTap: () {
              // Navigate to the search three page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchInProgress(initialTabIndex: selectedChipIndex)),
              );
            },
            child:
                Text("View All", style: CustomTextStyles.bodyMediumRegular_1),
          ),
        )
      ]),
    );
  }

  /// Section Widget
  Widget _buildPopularHotelsSection3(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Best Deals", style: CustomTextStyles.titleLarge23),
        Padding(
          padding: EdgeInsets.only(top: 9.v, bottom: 2.v),
          child: GestureDetector(
            onTap: () {
              // Navigate to the search three page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchInProgress(
                          initialTabIndex: selectedChipIndex,
                        )),
              );
            },
            child:
                Text("View All", style: CustomTextStyles.bodyMediumRegular_1),
          ),
        )
      ]),
    );
  }

  /// Section Widget
  Widget _buildPopularHotelsSection4(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Eye catching tours", style: CustomTextStyles.titleLarge23),
        Padding(
          padding: EdgeInsets.only(top: 9.v, bottom: 2.v),
          child: GestureDetector(
            onTap: () {
              // Navigate to the search three page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchInProgress(initialTabIndex: selectedChipIndex)),
              );
            },
            child:
                Text("View All", style: CustomTextStyles.bodyMediumRegular_1),
          ),
        )
      ]),
    );
  }

  /// Section Widget
  Widget _buildPopularHotelsSection5(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Other Services", style: CustomTextStyles.titleLarge23),
        Padding(
          padding: EdgeInsets.only(top: 9.v, bottom: 2.v),
          child: GestureDetector(
            onTap: () {
              // Navigate to the search three page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchInProgress(initialTabIndex: selectedChipIndex)),
              );
            },
            child:
                Text("View All", style: CustomTextStyles.bodyMediumRegular_1),
          ),
        )
      ]),
    );
  }

  /// Section Widget
  Widget _buildHomeSection(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        if (provider.propertyListModel == null ||
            provider.propertyListModel!.result!.isEmpty) {
          return Center(child: const CircularProgressIndicator());
        } else {
          // Access the data you need from the provider
          List<PropertyModel> items = provider.propertyListModel!.result!;

          return SizedBox(
            height: 219.v,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 15.h);
              },
              itemCount: items.length,
              itemBuilder: (context, index) {
                PropertyModel currentItem = items[index];

                return HomesectionItemWidget(
                  // Customize parameters based on currentItem if needed
                  onTapImgSpain: () {
                    providerServices?.getAllRoomsList(currentItem.propertyId);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HotelDetail(property: currentItem)),
                    );
                    // onTapImgSpain(context);
                  },
                  property: currentItem, // Pass the specific PropertyModel
                );
              },
            ),
          );
        }
      },
    );
  }

  /// Section Widget
  Widget _buildHomeSection2(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        if (provider.vehicleListModel == null ||
            provider.vehicleListModel!.result!.isEmpty) {
          return Center(child: const CircularProgressIndicator());
        } else {
          // Access the data you need from the provider
          List<VehicleModel> items = provider.vehicleListModel!.result!;

          return SizedBox(
            height: 219.v,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 15.h);
              },
              itemCount: items.length,
              itemBuilder: (context, index) {
                VehicleModel currentItem = items[index];

                return VehiclesectionItemWidget(
                  // Customize parameters based on currentItem if needed
                  onTapImgSpain: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VehicleDetail(vehicle: currentItem)),
                    );
                    // onTapImgSpain(context);
                  },
                  vehicle: currentItem, // Pass the specific PropertyModel
                );
              },
            ),
          );
        }
      },
    );
  }

  /// Section Widget
  Widget _buildHomeSection3(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        if (provider.flightListModel == null ||
            provider.flightListModel!.result!.isEmpty) {
          return Center(child: const CircularProgressIndicator());
        } else {
          // Access the data you need from the provider
          List<FlightModel> items = provider.flightListModel!.result!;

          return SizedBox(
            height: 219.v,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 15.h);
              },
              itemCount: items.length,
              itemBuilder: (context, index) {
                FlightModel currentItem = items[index];

                return FlightsectionItemWidget(
                  // Customize parameters based on currentItem if needed
                  onTapImgSpain: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FlightDetail(flight: currentItem)),
                    );
                    // onTapImgSpain(context);
                  },
                  flight: currentItem, // Pass the specific PropertyModel
                );
              },
            ),
          );
        }
      },
    );
  }

  /// Section Widget
  Widget _buildHomeSection4(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        if (provider.tourListModel == null ||
            provider.tourListModel!.result!.isEmpty) {
          return Center(child: const CircularProgressIndicator());
        } else {
          // Access the data you need from the provider
          List<TourModel> items = provider.tourListModel!.result!;

          return SizedBox(
            height: 219.v,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 15.h);
              },
              itemCount: items.length,
              itemBuilder: (context, index) {
                TourModel currentItem = items[index];

                return ToursectionItemWidget(
                  // Customize parameters based on currentItem if needed
                  onTapImgSpain: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TourDetail(tour: currentItem)),
                    );
                    // onTapImgSpain(context);
                  },
                  tour: currentItem, // Pass the specific PropertyModel
                );
              },
            ),
          );
        }
      },
    );
  }

  /// Section Widget
  Widget _buildHomeSection5(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        if (provider.serviceListModel == null ||
            provider.serviceListModel!.result!.isEmpty) {
          return Center(child: const CircularProgressIndicator());
        } else {
          // Access the data you need from the provider
          List<ServicesModel> items = provider.serviceListModel!.result!;

          return SizedBox(
            height: 219.v,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 15.h);
              },
              itemCount: items.length,
              itemBuilder: (context, index) {
                ServicesModel currentItem = items[index];

                return ServicesectionItemWidget(
                  // Customize parameters based on currentItem if needed
                  onTapImgSpain: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ServiceDetail(service: currentItem)),
                    );
                    // onTapImgSpain(context);
                  },
                  service: currentItem, // Pass the specific PropertyModel
                );
              },
            ),
          );
        }
      },
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndexx,
      onTap: (index) {
        setState(() {
          _currentIndexx = index;
          for (var i = 0; i < bottomMenuList.length; i++) {
            bottomMenuList[i].isSelected = (i == index);
          }
        });
      },
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.transparent,
      items: bottomMenuList.map((item) {
        return BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: item.isSelected ? Color(0xff003B95) : null,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              item.isSelected ? item.activeIcon : item.icon,
              width: 24,
              height: 24,
              color: item.isSelected ? Colors.white : null,
            ),
          ),
          label: '',
        );
      }).toList(),
    );
  }

  void selectItem(int index) {
    setState(() {
      _currentIndexx = index;
      for (var i = 0; i < bottomMenuList.length; i++) {
        bottomMenuList[i].isSelected = (i == index);
      }
    });
  }

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      activeIcon: ImageConstant.imgHome,
      type: BottomBarEnum.Home,
      isSelected: false,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgVuesaxLinearHeart,
      activeIcon: ImageConstant.imgVuesaxLinearHeart,
      type: BottomBarEnum.Vuesaxlinearheart,
      isSelected: false,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgBag,
      activeIcon: ImageConstant.imgBag,
      type: BottomBarEnum.Bag,
      isSelected: false,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUser,
      activeIcon: ImageConstant.imgUser,
      type: BottomBarEnum.User,
      isSelected: false,
    ),
  ];

  // Widget buildBottomNavigationBar() {
  //   List<BottomMenuModel> bottomMenuList = [
  //     BottomMenuModel(
  //       icon: ImageConstant.imgHome,
  //       activeIcon: ImageConstant.imgHome,
  //       type: BottomBarEnum.Home,
  //       isSelected: true,
  //     ),
  //     BottomMenuModel(
  //       icon: ImageConstant.imgVuesaxLinearHeart,
  //       activeIcon: ImageConstant.imgVuesaxLinearHeart,
  //       type: BottomBarEnum.Vuesaxlinearheart,
  //     ),
  //     BottomMenuModel(
  //       icon: ImageConstant.imgBag,
  //       activeIcon: ImageConstant.imgBag,
  //       type: BottomBarEnum.Bag,
  //     ),
  //     BottomMenuModel(
  //       icon: ImageConstant.imgUser,
  //       activeIcon: ImageConstant.imgUser,
  //       type: BottomBarEnum.User,
  //     ),
  //   ];
  //
  //   return BottomNavigationBar(
  //     currentIndex: _currentIndexx,
  //     onTap: (index) {
  //       setState(() {
  //         _currentIndexx = index;
  //         for (var i = 0; i < bottomMenuList.length; i++) {
  //           bottomMenuList[i].isSelected = (i == index);
  //           bottomMenuList[i].updateColor(); // Update color based on selection
  //         }
  //       });
  //     },
  //     selectedItemColor: Colors.blue,
  //     unselectedItemColor: Colors.transparent,
  //     items: bottomMenuList.map((item) {
  //       return BottomNavigationBarItem(
  //         icon: Container(
  //           decoration: BoxDecoration(
  //             color: item.itemColor, // Use the itemColor property
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           padding: EdgeInsets.all(10),
  //           child: SvgPicture.asset(
  //             item.isSelected ? item.activeIcon : item.icon,
  //             width: 24,
  //             height: 24,
  //           ),
  //         ),
  //         label: '',
  //       );
  //     }).toList(),
  //   );
  // }
  //

  Widget _buildContenBasedOnSelectedWidget() {
    switch (selectedChipIndex) {
      case 0:
        return _buildVariation11();
      case 1:
        return _buildVariation12();
      case 2:
        return _buildVariation13();
      case 3:
        return _buildVariation14();
      case 4:
        return _buildVariation15();
      default:
        return Container(); // Placeholder, change as per your requirement
    }
  }

  PreferredSizeWidget _buildAppBarBasedOnSelectedWidget(
      ProviderServices provider) {
    switch (selectedChipIndex) {
      case 0:
        return _buildAppBar(context, provider);
      case 1:
        return _buildAppBar2(context, provider);
      case 2:
        return _buildAppBar2(context, provider);
      case 3:
        return _buildAppBar2(context, provider);
      case 4:
        return _buildAppBar2(context, provider);
      default:
        return _buildAppBar2(
            context, provider); // Placeholder, change as per your requirement
    }
  }

  Widget _buildVariation11() {
    return Column(
      children: [
        SizedBox(height: 18.v),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 287.h,
            margin: EdgeInsets.only(left: 15.h),
            child: Text(
              "Where would you like to go?",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineLarge!.copyWith(
                height: 1.40,
              ),
            ),
          ),
        ),
        SizedBox(height: 26.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchInProgress(initialTabIndex: selectedChipIndex)),
              );
            },
            child: AbsorbPointer(
              absorbing:
                  true, // Make the child (CustomSearchView) non-interactive
              child: CustomSearchView(
                controller: searchController,
                hintText: "Search Your Place",
              ),
            ),
          ),
        ),
        SizedBox(height: 25.v),
      ],
    );
  }

  Widget _buildVariation12() {
    return Column(
      children: [
        SizedBox(height: 18.v),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 287.h,
            margin: EdgeInsets.only(left: 15.h),
            child: Text(
              "Need a Exceptional Ride?",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineLarge!.copyWith(
                height: 1.40,
              ),
            ),
          ),
        ),
        SizedBox(height: 26.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchInProgress(initialTabIndex: selectedChipIndex)),
              );
            },
            child: AbsorbPointer(
              absorbing:
                  true, // Make the child (CustomSearchView) non-interactive
              child: CustomSearchView(
                controller: searchController,
                hintText: "Search Your Place",
              ),
            ),
          ),
        ),
        SizedBox(height: 25.v),
      ],
    );
  }

  Widget _buildVariation13() {
    return Column(
      children: [
        SizedBox(height: 18.v),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 287.h,
            margin: EdgeInsets.only(left: 15.h),
            child: Text(
              "Want to fly like a king?",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineLarge!.copyWith(
                height: 1.40,
              ),
            ),
          ),
        ),
        SizedBox(height: 26.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchInProgress(initialTabIndex: selectedChipIndex)),
              );
            },
            child: AbsorbPointer(
              absorbing:
                  true, // Make the child (CustomSearchView) non-interactive
              child: CustomSearchView(
                controller: searchController,
                hintText: "Search Your Place",
              ),
            ),
          ),
        ),
        SizedBox(height: 25.v),
      ],
    );
  }

  Widget _buildVariation14() {
    return Column(
      children: [
        SizedBox(height: 18.v),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 287.h,
            margin: EdgeInsets.only(left: 15.h),
            child: Text(
              "Need a professional tour?",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineLarge!.copyWith(
                height: 1.40,
              ),
            ),
          ),
        ),
        SizedBox(height: 26.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchInProgress(initialTabIndex: selectedChipIndex)),
              );
            },
            child: AbsorbPointer(
              absorbing:
                  true, // Make the child (CustomSearchView) non-interactive
              child: CustomSearchView(
                controller: searchController,
                hintText: "Search Your Place",
              ),
            ),
          ),
        ),
        SizedBox(height: 25.v),
      ],
    );
  }

  Widget _buildVariation15() {
    return Column(
      children: [
        SizedBox(height: 18.v),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 287.h,
            margin: EdgeInsets.only(left: 15.h),
            child: Text(
              "Need a professional service?",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineLarge!.copyWith(
                height: 1.40,
              ),
            ),
          ),
        ),
        SizedBox(height: 26.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchInProgress(initialTabIndex: selectedChipIndex)),
              );
            },
            child: AbsorbPointer(
              absorbing:
                  true, // Make the child (CustomSearchView) non-interactive
              child: CustomSearchView(
                controller: searchController,
                hintText: "Search Your Place",
              ),
            ),
          ),
        ),
        SizedBox(height: 25.v),
      ],
    );
  }

  Widget _buildContentBasedOnSelectedWidget() {
    switch (selectedChipIndex) {
      case 0:
        return _buildVariation1();
      case 1:
        return _buildVariation2();
      case 2:
        return _buildVariation3();
      case 3:
        return _buildVariation4();
      case 4:
        return _buildVariation5();
      default:
        return Container(); // Placeholder, change as per your requirement
    }
  }

  Widget _buildVariation1() {
    return Padding(
      padding: EdgeInsets.only(left: 15.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildPopularHotelsSection(context),
        SizedBox(height: 27.v),
        _buildHomeSection(context),
        SizedBox(height: 40.v),
        Text("Hot Deals", style: CustomTextStyles.titleLarge23),
        SizedBox(height: 29.v),
        _buildHotDealsSection(context)
      ]),
    );
  }

  Widget _buildVariation2() {
    // Implement variation 2 content here
    // Example:
    return Padding(
      padding: EdgeInsets.only(left: 15.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildPopularHotelsSection2(context),
        SizedBox(height: 27.v),
        _buildHomeSection2(context),
        SizedBox(height: 40.v),
        // Text("Hot Deals 2",
        //     style: CustomTextStyles.titleLarge23),
        SizedBox(height: 29.v),
        _buildHotDealsSection2(context)
      ]),
    );
  }

// Implement _buildVariation3, _buildVariation4, _buildVariation5 similarly

// Example for variation 3:
  Widget _buildVariation3() {
    return Padding(
      padding: EdgeInsets.only(left: 15.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildPopularHotelsSection3(context),
        SizedBox(height: 27.v),
        _buildHomeSection3(context),
        SizedBox(height: 40.v),
        // Text("Best Deals",
        //     style: CustomTextStyles.titleLarge23),
        SizedBox(height: 29.v),
        _buildHotDealsSection3(context)
      ]),
    );
  }

// Example for variation 4:
  Widget _buildVariation4() {
    return Padding(
      padding: EdgeInsets.only(left: 15.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildPopularHotelsSection4(context),
        SizedBox(height: 27.v),
        _buildHomeSection4(context),
        SizedBox(height: 40.v),
        // Text("Hot Deals 4",
        //     style: CustomTextStyles.titleLarge23),
        SizedBox(height: 29.v),
        _buildHotDealsSection4(context)
      ]),
    );
  }

// Example for variation 5:
  Widget _buildVariation5() {
    return Padding(
      padding: EdgeInsets.only(left: 15.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildPopularHotelsSection5(context),
        SizedBox(height: 27.v),
        _buildHomeSection5(context),
        SizedBox(height: 40.v),
        Text("Other Services", style: CustomTextStyles.titleLarge23),
        SizedBox(height: 29.v),
        _buildHotDealsSection5(context)
      ]),
    );
  }

  /// Navigates to the hotelSixScreen when the action is triggered.
  onTapImgSpain(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (ctx) => HotelDetail()),
    // );
  }

  Widget _buildHotDealsSection(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        if (provider.propertyListModel == null) {
          return Center(child: const CircularProgressIndicator());
        } else {
          List<PropertyModel> items = provider.propertyListModel!.result!;

          return SizedBox(
            height: 219.v,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(items.length, (index) {
                PropertyModel currentItem = items[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HotelDetail(property: currentItem),
                      ),
                    );
                  },
                  child: Container(
                    width: 350.h, // Adjust the width as needed
                    height: 200.h, // Adjust the height as needed
                    margin: EdgeInsets.only(right: 10.h),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomImageView(
                          imagePath: ('${currentItem.propertyPic2}'),
                          height: 200
                              .v, // Make sure the height matches the Container's height
                          width: 350.h,
                          fit: BoxFit.cover, // Adjust the width as needed
                          radius: BorderRadius.circular(20.h),
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomElevatedButton(
                                height: 37.v,
                                width: 150.h,
                                text: currentItem.hostName.toString(),
                                margin: EdgeInsets.only(left: 14.h),
                                buttonStyle: CustomButtonStyles.fillBlueTL18,
                                buttonTextStyle:
                                    CustomTextStyles.titleSmallOnPrimary,
                              ),
                              SizedBox(height: 32.v),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.h,
                                  vertical: 12.v,
                                ),
                                decoration: AppDecoration
                                    .gradientBlackToOnPrimary
                                    .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL20,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 45.v),
                                    Text(
                                      currentItem.propertyType.toString(),
                                      style:
                                          CustomTextStyles.titleSmallOnPrimary,
                                    ),
                                    SizedBox(height: 6.v),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder7,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ('${currentItem.propertyPic2}'),
                                            height: 12.v,
                                            width: 8.h,
                                            radius: BorderRadius.circular(4.h),
                                            margin:
                                                EdgeInsets.only(bottom: 2.v),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 4.h),
                                            child: Text(
                                              currentItem.country.toString(),
                                              style: CustomTextStyles
                                                  .bodySmallOnPrimary_1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: currentItem.price,
                                                style: CustomTextStyles
                                                    .titleSmallOnPrimary_2,
                                              ),
                                              TextSpan(
                                                text: " night",
                                                style: CustomTextStyles
                                                    .bodyMediumOnPrimary,
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 3.v),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder7,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ('${currentItem.propertyPic2}'),
                                                height: 13.adaptSize,
                                                width: 13.adaptSize,
                                                radius:
                                                    BorderRadius.circular(6.h),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 2.h),
                                                child: Text(
                                                  currentItem.propertyId
                                                      .toString(),
                                                  style: theme
                                                      .textTheme.labelSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        }
      },
    );
  }

  Widget _buildHotDealsSection2(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        if (provider.vehicleListModel == null) {
          return Center(child: const CircularProgressIndicator());
        } else {
          List<VehicleModel> items = provider.vehicleListModel!.result!;

          return SizedBox(
            height: 219.v,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(items.length, (index) {
                VehicleModel currentItem = items[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VehicleDetail(vehicle: currentItem),
                      ),
                    );
                  },
                  child: Container(
                    width: 350.h, // Adjust the width as needed
                    height: 200.h, // Adjust the height as needed
                    margin: EdgeInsets.only(right: 10.h),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomImageView(
                          imagePath: ('${currentItem.vehiclePic2}'),
                          height: 200
                              .v, // Make sure the height matches the Container's height
                          width: 350.h,
                          fit: BoxFit.cover, // Adjust the width as needed
                          radius: BorderRadius.circular(20.h),
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomElevatedButton(
                                height: 37.v,
                                width: 150.h,
                                text: currentItem.hostName.toString(),
                                margin: EdgeInsets.only(left: 14.h),
                                buttonStyle: CustomButtonStyles.fillBlueTL18,
                                buttonTextStyle:
                                    CustomTextStyles.titleSmallOnPrimary,
                              ),
                              SizedBox(height: 32.v),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.h,
                                  vertical: 12.v,
                                ),
                                decoration: AppDecoration
                                    .gradientBlackToOnPrimary
                                    .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL20,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 45.v),
                                    Text(
                                      currentItem.vehicleModel.toString(),
                                      style:
                                          CustomTextStyles.titleSmallOnPrimary,
                                    ),
                                    SizedBox(height: 6.v),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder7,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ('${currentItem.vehiclePic2}'),
                                            height: 12.v,
                                            width: 8.h,
                                            radius: BorderRadius.circular(4.h),
                                            margin:
                                                EdgeInsets.only(bottom: 2.v),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 4.h),
                                            child: Text(
                                              currentItem.country.toString(),
                                              style: CustomTextStyles
                                                  .bodySmallOnPrimary_1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: currentItem.price,
                                                style: CustomTextStyles
                                                    .titleSmallOnPrimary_2,
                                              ),
                                              // TextSpan(
                                              //   text: " night",
                                              //   style: CustomTextStyles.bodyMediumOnPrimary,
                                              // ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 3.v),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder7,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ('${currentItem.vehiclePic2}'),
                                                height: 13.adaptSize,
                                                width: 13.adaptSize,
                                                radius:
                                                    BorderRadius.circular(6.h),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 2.h),
                                                child: Text(
                                                  currentItem.vehicleId
                                                      .toString(),
                                                  style: theme
                                                      .textTheme.labelSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        }
      },
    );
  }

  Widget _buildHotDealsSection3(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        if (provider.flightListModel == null) {
          return Center(child: const CircularProgressIndicator());
        } else {
          List<FlightModel> items = provider.flightListModel!.result!;

          return SizedBox(
            height: 219.v,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(items.length, (index) {
                FlightModel currentItem = items[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlightDetail(flight: currentItem),
                      ),
                    );
                  },
                  child: Container(
                    width: 350.h, // Adjust the width as needed
                    height: 200.h, // Adjust the height as needed
                    margin: EdgeInsets.only(right: 10.h),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomImageView(
                          imagePath: ('${currentItem.flightPic2}'),
                          height: 200
                              .v, // Make sure the height matches the Container's height
                          width: 350.h,
                          fit: BoxFit.cover, // Adjust the width as needed
                          radius: BorderRadius.circular(20.h),
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomElevatedButton(
                                height: 37.v,
                                width: 150.h,
                                text: currentItem.hostName.toString(),
                                margin: EdgeInsets.only(left: 14.h),
                                buttonStyle: CustomButtonStyles.fillBlueTL18,
                                buttonTextStyle:
                                    CustomTextStyles.titleSmallOnPrimary,
                              ),
                              SizedBox(height: 32.v),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.h,
                                  vertical: 12.v,
                                ),
                                decoration: AppDecoration
                                    .gradientBlackToOnPrimary
                                    .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL20,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 45.v),
                                    Text(
                                      currentItem.flightCategory.toString(),
                                      style:
                                          CustomTextStyles.titleSmallOnPrimary,
                                    ),
                                    SizedBox(height: 6.v),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder7,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ('${currentItem.flightPic2}'),
                                            height: 12.v,
                                            width: 8.h,
                                            radius: BorderRadius.circular(4.h),
                                            margin:
                                                EdgeInsets.only(bottom: 2.v),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 4.h),
                                            child: Text(
                                              currentItem.arrival.toString(),
                                              style: CustomTextStyles
                                                  .bodySmallOnPrimary_1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: currentItem.price,
                                                style: CustomTextStyles
                                                    .titleSmallOnPrimary_2,
                                              ),
                                              // TextSpan(
                                              //   text: " night",
                                              //   style: CustomTextStyles.bodyMediumOnPrimary,
                                              // ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 3.v),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder7,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ('${currentItem.flightPic2}'),
                                                height: 13.adaptSize,
                                                width: 13.adaptSize,
                                                radius:
                                                    BorderRadius.circular(6.h),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 2.h),
                                                child: Text(
                                                  currentItem.flightId
                                                      .toString(),
                                                  style: theme
                                                      .textTheme.labelSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        }
      },
    );
  }

  // build hot deals 3

  Widget _buildHotDealsSection4(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        if (provider.tourListModel == null) {
          return Center(child: const CircularProgressIndicator());
        } else {
          List<TourModel> items = provider.tourListModel!.result!;

          return SizedBox(
            height: 219.v,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(items.length, (index) {
                TourModel currentItem = items[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TourDetail(tour: currentItem),
                      ),
                    );
                  },
                  child: Container(
                    width: 350.h, // Adjust the width as needed
                    height: 200.h, // Adjust the height as needed
                    margin: EdgeInsets.only(right: 10.h),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomImageView(
                          imagePath: ('${currentItem.tourPic2}'),
                          height: 200
                              .v, // Make sure the height matches the Container's height
                          width: 350.h,
                          fit: BoxFit.cover, // Adjust the width as needed
                          radius: BorderRadius.circular(20.h),
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomElevatedButton(
                                height: 37.v,
                                width: 150.h,
                                text: currentItem.tourName.toString(),
                                margin: EdgeInsets.only(left: 14.h),
                                buttonStyle: CustomButtonStyles.fillBlueTL18,
                                buttonTextStyle:
                                    CustomTextStyles.titleSmallOnPrimary,
                              ),
                              SizedBox(height: 32.v),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.h,
                                  vertical: 12.v,
                                ),
                                decoration: AppDecoration
                                    .gradientBlackToOnPrimary
                                    .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL20,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 45.v),
                                    Text(
                                      currentItem.tourType.toString(),
                                      style:
                                          CustomTextStyles.titleSmallOnPrimary,
                                    ),
                                    SizedBox(height: 6.v),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder7,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ('${currentItem.tourPic3}'),
                                            height: 12.v,
                                            width: 8.h,
                                            radius: BorderRadius.circular(4.h),
                                            margin:
                                                EdgeInsets.only(bottom: 2.v),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 4.h),
                                            child: Text(
                                              currentItem.city.toString(),
                                              style: CustomTextStyles
                                                  .bodySmallOnPrimary_1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: currentItem.price,
                                                style: CustomTextStyles
                                                    .titleSmallOnPrimary_2,
                                              ),
                                              // TextSpan(
                                              //   text: " night",
                                              //   style: CustomTextStyles.bodyMediumOnPrimary,
                                              // ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 3.v),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder7,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ('${currentItem.tourPic2}'),
                                                height: 13.adaptSize,
                                                width: 13.adaptSize,
                                                radius:
                                                    BorderRadius.circular(6.h),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 2.h),
                                                child: Text(
                                                  currentItem.zipCode
                                                      .toString(),
                                                  style: theme
                                                      .textTheme.labelSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        }
      },
    );
  }

  // build hot deals 4

  Widget _buildHotDealsSection5(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        if (provider.serviceListModel == null) {
          return Center(child: const CircularProgressIndicator());
        } else {
          List<ServicesModel> items = provider.serviceListModel!.result!;

          return SizedBox(
            height: 219.v,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(items.length, (index) {
                ServicesModel currentItem = items[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ServiceDetail(service: currentItem),
                      ),
                    );
                  },
                  child: Container(
                    width: 350.h, // Adjust the width as needed
                    height: 200.h, // Adjust the height as needed
                    margin: EdgeInsets.only(right: 10.h),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomImageView(
                          imagePath: ('${currentItem.servicePic2}'),
                          height: 200
                              .v, // Make sure the height matches the Container's height
                          width: 350.h,
                          fit: BoxFit.cover, // Adjust the width as needed
                          radius: BorderRadius.circular(20.h),
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomElevatedButton(
                                height: 37.v,
                                width: 250.h,
                                text: currentItem.serviceName.toString(),
                                margin: EdgeInsets.only(left: 14.h),
                                buttonStyle: CustomButtonStyles.fillBlueTL18,
                                buttonTextStyle:
                                    CustomTextStyles.titleSmallOnPrimary,
                              ),
                              SizedBox(height: 32.v),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.h,
                                  vertical: 12.v,
                                ),
                                decoration: AppDecoration
                                    .gradientBlackToOnPrimary
                                    .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL20,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 45.v),
                                    Text(
                                      currentItem.serviceType.toString(),
                                      style:
                                          CustomTextStyles.titleSmallOnPrimary,
                                    ),
                                    SizedBox(height: 6.v),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder7,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ('${currentItem.servicePic3}'),
                                            height: 12.v,
                                            width: 8.h,
                                            radius: BorderRadius.circular(4.h),
                                            margin:
                                                EdgeInsets.only(bottom: 2.v),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 4.h),
                                            child: Text(
                                              currentItem.city.toString(),
                                              style: CustomTextStyles
                                                  .bodySmallOnPrimary_1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: currentItem.price,
                                                style: CustomTextStyles
                                                    .titleSmallOnPrimary_2,
                                              ),
                                              // TextSpan(
                                              //   text: " night",
                                              //   style: CustomTextStyles.bodyMediumOnPrimary,
                                              // ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 3.v),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder7,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ('${currentItem.servicePic2}'),
                                                height: 13.adaptSize,
                                                width: 13.adaptSize,
                                                radius:
                                                    BorderRadius.circular(6.h),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 2.h),
                                                child: Text(
                                                  currentItem.zipCode
                                                      .toString(),
                                                  style: theme
                                                      .textTheme.labelSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        }
      },
    );
  }

  // build hot deals 5

  Widget _buildHotDealsSection6(BuildContext context) {
    return SizedBox(
      height: 219.v,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(5, (index) {
          return Container(
            width: 400.h,
            margin:
                EdgeInsets.only(right: 16.h), // Adjust spacing between items
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgFernandoAlvare,
                  height: 219.v,
                  width: 400.h,
                  radius: BorderRadius.circular(20.h),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomElevatedButton(
                        height: 37.v,
                        width: 93.h,
                        text: "20% Off",
                        margin: EdgeInsets.only(left: 14.h),
                        buttonStyle: CustomButtonStyles.fillBlueTL18,
                        buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
                      ),
                      SizedBox(height: 32.v),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.h,
                          vertical: 12.v,
                        ),
                        decoration: AppDecoration.gradientBlackToOnPrimary
                            .copyWith(
                                borderRadius:
                                    BorderRadiusStyle.customBorderTL20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 45.v),
                            Text(
                              "Mandarin Oriental",
                              style: CustomTextStyles.titleSmallOnPrimary,
                            ),
                            SizedBox(height: 6.v),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusStyle.roundedBorder7,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgVectorOnprimary,
                                    height: 12.v,
                                    width: 8.h,
                                    radius: BorderRadius.circular(4.h),
                                    margin: EdgeInsets.only(bottom: 2.v),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "Bangkok, Thailand",
                                      style:
                                          CustomTextStyles.bodySmallOnPrimary_1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: " 799/",
                                        style: CustomTextStyles
                                            .titleSmallOnPrimary_2,
                                      ),
                                      TextSpan(
                                        text: " night",
                                        style: CustomTextStyles
                                            .bodyMediumOnPrimary,
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 3.v),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder7,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgStarRate,
                                        height: 13.adaptSize,
                                        width: 13.adaptSize,
                                        radius: BorderRadius.circular(6.h),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Text(
                                          "4.9",
                                          style: theme.textTheme.labelSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

// build hot deals 6
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
    this.isSelected = false,
  });

  String icon;
  String activeIcon;
  BottomBarEnum type;
  bool isSelected;
  Color itemColor = Colors.transparent; // Add a color property

  // Update the color property based on selection
  void updateColor() {
    itemColor = isSelected ? Colors.blue : Colors.transparent;
  }
}

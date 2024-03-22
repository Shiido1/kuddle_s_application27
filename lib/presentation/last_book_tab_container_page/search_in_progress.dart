import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/last_book_complete_page/last_book_complete_page.dart';
import 'package:kuddle_s_application27/presentation/last_book_page/last_book_page.dart';
import 'package:kuddle_s_application27/presentation/last_book_tab_container_page/modal_filter_frame.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../../pages/home/model/flight_list_model/flight_model.dart';
import '../../pages/home/model/property_list_model/property_model.dart';
import '../../pages/home/model/services_list_model/services_model.dart';
import '../../pages/home/model/tour_list_model/tour_model.dart';
import '../../pages/home/model/vehicle_list_model/vehicle_model.dart';
import '../../services/provider/provider_services.dart';
import '../../widgets/custom_search_view.dart';
import '../home_page/flight_detail.dart';
import '../home_page/hotel_detail.dart';
import '../home_page/service_detail.dart';
import '../home_page/tour_detail.dart';
import '../home_page/vehicle_detail.dart';
import '../search_page/widgets/search_item_widget.dart';
import 'package:intl/intl.dart';

class SearchInProgress extends StatefulWidget {
  const SearchInProgress({Key? key, required this.initialTabIndex})
      : super(key: key);

  final int initialTabIndex;

  @override
  SearchInProgressState createState() => SearchInProgressState();
}

class SearchInProgressState extends State<SearchInProgress>
    with TickerProviderStateMixin {
  late TabController tabviewController;
  TextEditingController searchController = TextEditingController();
  // String _query = '';
  List searchItem = [];
  ProviderServices? providerServices;
  late Debouncer _debouncer; // Declare Debouncer instance here
  double minPrice = 0.0;
  double maxPrice = 6000000.00;

  int? value;

  @override
  void initState() {
    super.initState();
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getAllPropertiesList();
    providerServices?.getAllVehiclesList();
    providerServices?.getAllFlightsList();
    providerServices?.getAllToursList();
    providerServices?.getAllServicesList();

    tabviewController = TabController(
        length: 5, vsync: this, initialIndex: widget.initialTabIndex);

    // Initialize the Debouncer here
    _debouncer = Debouncer(milliseconds: 500);

    searchItem.clear();
  }

  @override
  void dispose() {
    searchController.dispose(); // Dispose of searchController
    super.dispose();
  }

  void _showBottomModalFilter(BuildContext? context) {
    showModalBottomSheet(
        context: context!,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(14))),
        builder: (context) => DraggableScrollableSheet(
            expand: false,
            initialChildSize: .4,
            maxChildSize: .9,
            minChildSize: .32,
            builder: (context, scrollController) =>
                ModalFilterFrame(scrollController: scrollController)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderServices>(builder: (context, myData, __) {
      return SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  child: CustomSearchView(
                    width: 900,
                    controller: searchController,
                    onTapped: () =>
                        value == 4 ? _showBottomModalFilter(context) : () {},
                    onChanged: (v) {
                      // Use the debouncer to delay the search
                      _debouncer.run(() {
                        myData.query = myData.query;
                        setState(() => myData.query = v);
                        myData.notifyListeners();
                        // Perform your search operation here
                        // You can call your search function or update the UI based on the search query
                      });
                    },
                    hintText: "Search",
                    // suffix: GestureDetector(
                    //   onTap: () {
                    //     showModalBottomSheet(
                    //       context: context,
                    //       isScrollControlled: true,
                    //       builder: (BuildContext context) {
                    //         return Container(
                    //           height: MediaQuery.of(context).size.height - 300,
                    //           child: SearchFilterBottomsheet(),
                    //         );
                    //       },
                    //     );
                    //   },
                    //   child: Container(
                    //     margin: EdgeInsets.fromLTRB(30.h, 7.v, 11.h, 7.v),
                    //     child: CustomImageView(
                    //       imagePath: ImageConstant.imgFilterlist,
                    //       height: 30.adaptSize,
                    //       width: 30.adaptSize,
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
                SizedBox(height: 24.v),
                _buildTabview(context),
                // SizedBox(height: 24.v),
                // _buildFilteredThirty(context),
                Expanded(
                  child: SizedBox(
                    height: 740.v,
                    child: TabBarView(
                      controller: tabviewController,
                      children: [
                        _performAccommodationSearch(context),
                        _performVehiclesSearch(context),
                        _performFlightsSearch(context),
                        _performToursSearch(context),
                        _performServicesSearch(context),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftPrimary,
        margin: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 12.v),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarTitle(
        text: 'search',
        margin: EdgeInsets.only(left: 14.h),
      ),
    );
  }

  Widget _buildTabview(BuildContext context) {
    const double chipSpacing = 13.0; // Adjust the spacing as needed

    List<String> chipNames = [
      "Accommodation",
      "Car",
      "Flights",
      "Tours",
      "Services"
    ];

    return Container(
      height: 37.v,
      width: double.infinity,
      margin: EdgeInsets.only(left: 15.h),
      child: DefaultTabController(
        length: chipNames.length,
        child: TabBar(
          onTap: (v) {
            value = v;
            setState(() {});
          },
          controller: tabviewController,
          isScrollable: true, // Make the tabs scrollable
          labelPadding: EdgeInsets.zero,
          labelColor: Colors.white,
          unselectedLabelColor: theme.colorScheme.primary,
          labelStyle: TextStyle(
            fontSize: 14.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
          indicator: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(18.h),
          ),
          tabs: List<Widget>.generate(
            chipNames.length,
            (index) => Padding(
              padding: EdgeInsets.only(right: chipSpacing, left: chipSpacing),
              child: Tab(
                text: chipNames[index],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceFilter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Min Price: $minPrice"),
        Slider(
          value: minPrice,
          onChanged: (value) {
            print("Min Price: $value");
            setState(() {
              minPrice = value;
            });
          },
          min: 0.0,
          max: maxPrice,
        ),
        Text("Max Price: $maxPrice"),
        Slider(
          value: maxPrice,
          onChanged: (value) {
            print("Max Price: $value");
            setState(() {
              maxPrice = value;
            });
          },
          min: minPrice,
          max: maxPrice, // You can set this to an appropriate maximum value
        ),
        ElevatedButton(
          onPressed: () {
            _debouncer.run(() {
              setState(() {
                // Perform actions based on minPrice and maxPrice
                // e.g., filter items in your list
              });
            });
            Navigator.pop(context);
          },
          child: Text("Apply Filter"),
        ),
      ],
    );
  }

  Widget _buildFilteredThirty(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Filtered (30)",
            style: theme.textTheme.titleMedium,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height - 250,
                    child: _buildPriceFilter(context),
                  );
                },
              );
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgVuesaxLinearElement3,
              height: 20.adaptSize,
              width: 20.adaptSize,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgVuesaxLinearFatrows,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(left: 9.h),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch(BuildContext context) {
    switch (tabviewController.index) {
      case 0:
        print(tabviewController.index);
        return _performAccommodationSearch(context);
      case 1:
        print(tabviewController.index);
        return _performVehiclesSearch(context);
      case 2:
        print(tabviewController.index);
        return _performFlightsSearch(context);
      case 3:
        print(tabviewController.index);
        return _performToursSearch(context);
      case 4:
        print(tabviewController.index);
        return _performServicesSearch(context);
      default:
        return Container(); // Default case
    }
  }

  Widget _performAccommodationSearch(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 19.v,
            );
          },
          itemCount: provider.propertyListModel?.result!
                  .where((element) =>
                      element.hostName
                          ?.toLowerCase()
                          .contains(provider.query.toLowerCase()) ==
                      true)
                  .length ??
              0,
          itemBuilder: (context, index) {
            final List<PropertyModel>? filteredList = provider
                .propertyListModel?.result
                ?.where((element) => element.propertyName!
                    .toLowerCase()
                    .contains(provider.query.toLowerCase()))
                .toList();

            if (filteredList != null && index < filteredList.length) {
              final PropertyModel currentItem = filteredList[index];

              String? priceString =
                  currentItem.price != null && currentItem.price!.isNotEmpty
                      ? currentItem.price
                      : '0.0';

              double price = double.parse(priceString ?? '0.0');

              // Create a NumberFormat instance for currency formatting
              NumberFormat currencyFormatter =
                  NumberFormat.currency(symbol: '₦');

              // Format the currency string
              String formattedCurrency = currencyFormatter.format(price);
              // Use the contents of FavouriteSingleItemWidgett here
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HotelDetail(property: currentItem),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.h,
                    vertical: 5.v,
                  ),
                  decoration: AppDecoration.outlinePrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder13,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 40.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ('${currentItem.propertyPic1}'),
                              height: 108.v,
                              width: 116.h,
                              radius: BorderRadius.circular(
                                15.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 19.h,
                                top: 5.v,
                                bottom: 11.v,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${currentItem.propertyName}",
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 10.v),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgVectorGray700,
                                        height: 13.v,
                                        width: 8.h,
                                        margin: EdgeInsets.only(
                                          top: 1.v,
                                          bottom: 15.v,
                                        ),
                                      ),
                                      Container(
                                        width: 193.h,
                                        margin: EdgeInsets.only(left: 5.h),
                                        child: Text(
                                          "${currentItem.aboutProperty}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 9.v),
                                  // Text('${formattedCurrency}/Night'),
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
            } else {
              return SearchItemWidget();
            }
          },
        );
      },
    );
  }

  Widget _performVehiclesSearch(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 19.v,
            );
          },
          itemCount: provider.vehicleListModel?.result
                  ?.where(
                    (element) => element.hostName!
                        .toLowerCase()
                        .contains(provider.query.toLowerCase()),
                  )
                  ?.length ??
              0,
          itemBuilder: (context, index) {
            final List<VehicleModel>? filteredList = provider
                .vehicleListModel?.result
                ?.where((element) => element.vehicleName!
                    .toLowerCase()
                    .contains(provider.query.toLowerCase()))
                .toList();

            if (filteredList != null && index < filteredList.length) {
              final VehicleModel currentItem = filteredList[index];
              String? priceString =
                  currentItem.price != null && currentItem.price!.isNotEmpty
                      ? currentItem.price
                      : '0.0';

              // Convert the String to a double using double.parse
              double price = double.parse(priceString!);

              // Create a NumberFormat instance for currency formatting
              NumberFormat currencyFormatter =
                  NumberFormat.currency(symbol: '₦');

              // Format the currency string
              String formattedCurrency = currencyFormatter.format(price);
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VehicleDetail(vehicle: currentItem),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.h,
                    vertical: 5.v,
                  ),
                  decoration: AppDecoration.outlinePrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder13,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 40.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ('${currentItem.vehiclePic1}'),
                              height: 108.v,
                              width: 116.h,
                              radius: BorderRadius.circular(
                                15.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 19.h,
                                top: 5.v,
                                bottom: 11.v,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${currentItem.vehicleName}",
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 10.v),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgVectorGray700,
                                        height: 13.v,
                                        width: 8.h,
                                        margin: EdgeInsets.only(
                                          top: 1.v,
                                          bottom: 15.v,
                                        ),
                                      ),
                                      Container(
                                        width: 193.h,
                                        margin: EdgeInsets.only(left: 5.h),
                                        child: Text(
                                          "${currentItem.vehicleName}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 9.v),
                                  Text('${formattedCurrency}'),
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
            } else {
              return SearchItemWidget();
            }
          },
        );
      },
    );
  }

  Widget _performFlightsSearch(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 19.v,
            );
          },
          itemCount: provider.flightListModel?.result
                  ?.where(
                    (element) => element.hostName!
                        .toLowerCase()
                        .contains(provider.query.toLowerCase()),
                  )
                  ?.length ??
              0,
          itemBuilder: (context, index) {
            final List<FlightModel>? filteredList = provider
                .flightListModel?.result
                ?.where((element) => element.fromWhere!
                    .toLowerCase()
                    .contains(provider.query.toLowerCase()))
                .toList();

            if (filteredList != null && index < filteredList.length) {
              final FlightModel currentItem = filteredList[index];
              String? priceString =
                  currentItem.price != null && currentItem.price!.isNotEmpty
                      ? currentItem.price
                      : '0.0';

              // Convert the String to a double using double.parse
              double price = double.parse(priceString!);

              // Create a NumberFormat instance for currency formatting
              NumberFormat currencyFormatter =
                  NumberFormat.currency(symbol: '₦');

              // Format the currency string
              String formattedCurrency = currencyFormatter.format(price);
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.h,
                    vertical: 5.v,
                  ),
                  decoration: AppDecoration.outlinePrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder13,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 40.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ('${currentItem.flightPic1}'),
                              height: 108.v,
                              width: 116.h,
                              radius: BorderRadius.circular(
                                15.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 19.h,
                                top: 5.v,
                                bottom: 11.v,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${currentItem.hostName}",
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 10.v),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgVectorGray700,
                                        height: 13.v,
                                        width: 8.h,
                                        margin: EdgeInsets.only(
                                          top: 1.v,
                                          bottom: 15.v,
                                        ),
                                      ),
                                      Container(
                                        width: 193.h,
                                        margin: EdgeInsets.only(left: 5.h),
                                        child: Text(
                                          "${currentItem.flightCategory}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 9.v),
                                  Text('${formattedCurrency}'),
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
            } else {
              return SearchItemWidget();
            }
          },
        );
      },
    );
  }

  Widget _performToursSearch(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 19.v,
            );
          },
          itemCount: provider.tourListModel?.result
                  ?.where(
                    (element) => element.hostName!
                        .toLowerCase()
                        .contains(provider.query.toLowerCase()),
                  )
                  ?.length ??
              0,
          itemBuilder: (context, index) {
            final List<TourModel>? filteredList = provider.tourListModel?.result
                ?.where((element) => element.hostName!
                    .toLowerCase()
                    .contains(provider.query.toLowerCase()))
                .toList();

            if (filteredList != null && index < filteredList.length) {
              final TourModel currentItem = filteredList[index];
              String? priceString =
                  currentItem.price != null && currentItem.price!.isNotEmpty
                      ? currentItem.price
                      : '0.0';

              // Convert the String to a double using double.parse
              double price = double.parse(priceString!);

              // Create a NumberFormat instance for currency formatting
              NumberFormat currencyFormatter =
                  NumberFormat.currency(symbol: '₦');

              // Format the currency string
              String formattedCurrency = currencyFormatter.format(price);
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.h,
                    vertical: 5.v,
                  ),
                  decoration: AppDecoration.outlinePrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder13,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 40.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ('${currentItem.tourPic1}'),
                              height: 108.v,
                              width: 116.h,
                              radius: BorderRadius.circular(
                                15.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 19.h,
                                top: 5.v,
                                bottom: 11.v,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${currentItem.tourName}",
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 10.v),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgVectorGray700,
                                        height: 13.v,
                                        width: 8.h,
                                        margin: EdgeInsets.only(
                                          top: 1.v,
                                          bottom: 15.v,
                                        ),
                                      ),
                                      Container(
                                        width: 193.h,
                                        margin: EdgeInsets.only(left: 5.h),
                                        child: Text(
                                          "3/2 Thanon Khao, Vachirapayabal, Dusit.",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 9.v),
                                  Text('${formattedCurrency}'),
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
            } else {
              return SearchItemWidget();
            }
          },
        );
      },
    );
  }

  Widget _performServicesSearch(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 19.v,
            );
          },
          itemCount: provider.serviceListModel?.result
                  ?.where(
                    (element) => element.hostName!
                        .toLowerCase()
                        .contains(provider.query.toLowerCase()),
                  )
                  ?.length ??
              0,
          itemBuilder: (context, index) {
            final List<ServicesModel>? filteredList = provider
                .serviceListModel?.result
                ?.where((element) => element.hostName!
                    .toLowerCase()
                    .contains(provider.query.toLowerCase()))
                .toList();

            if (filteredList != null && index < filteredList.length) {
              final ServicesModel currentItem = filteredList[index];
              String? priceString =
                  currentItem.price != null && currentItem.price!.isNotEmpty
                      ? currentItem.price
                      : '0.0';

              // Convert the String to a double using double.parse
              double price = double.parse(priceString!);

              // Create a NumberFormat instance for currency formatting
              NumberFormat currencyFormatter =
                  NumberFormat.currency(symbol: '₦');

              // Format the currency string
              String formattedCurrency = currencyFormatter.format(price);
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceDetail(service: currentItem),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.h,
                    vertical: 5.v,
                  ),
                  decoration: AppDecoration.outlinePrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder13,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 40.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ('${currentItem.servicePic1}'),
                              height: 108.v,
                              width: 116.h,
                              radius: BorderRadius.circular(
                                15.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 19.h,
                                top: 5.v,
                                bottom: 11.v,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(
                                      "${currentItem.serviceName}",
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ),
                                  SizedBox(height: 10.v),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgVectorGray700,
                                        height: 13.v,
                                        width: 8.h,
                                        margin: EdgeInsets.only(
                                          top: 1.v,
                                          bottom: 15.v,
                                        ),
                                      ),
                                      Container(
                                        width: 193.h,
                                        margin: EdgeInsets.only(left: 5.h),
                                        child: Text(
                                          "${currentItem.aboutService}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 9.v),
                                  Text('${formattedCurrency}'),
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
            } else {
              return SearchItemWidget();
            }
          },
        );
      },
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class FavouriteSingleItemWidgett extends StatelessWidget {
  const FavouriteSingleItemWidgett({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 5.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder13,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 40.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgValeriiaBugaio219x190,
                  height: 108.v,
                  width: 116.h,
                  radius: BorderRadius.circular(
                    15.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 19.h,
                    top: 5.v,
                    bottom: 11.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hotel Royal",
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: 10.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgVectorGray700,
                            height: 13.v,
                            width: 8.h,
                            margin: EdgeInsets.only(
                              top: 1.v,
                              bottom: 15.v,
                            ),
                          ),
                          Container(
                            width: 193.h,
                            margin: EdgeInsets.only(left: 5.h),
                            child: Text(
                              "3/2 Thanon Khao, Vachirapayabal, Dusit.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9.v),

                      // Text('499/Night'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

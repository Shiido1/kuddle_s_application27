import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/last_book_complete_page/last_book_complete_page.dart';
import 'package:kuddle_s_application27/presentation/last_book_page/last_book_page.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:provider/provider.dart';

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
import '../home_page/widgets/flightsection_item_widget.dart';
import '../home_page/widgets/homesection_item_widget.dart';
import '../home_page/widgets/servicesection_item_widget.dart';
import '../home_page/widgets/toursection_item_widget.dart';
import '../home_page/widgets/vehiclesection_item_widget.dart';
import '../search_filter_bottomsheet/search_filter_bottomsheet.dart';
import '../search_page/widgets/search_item_widget.dart';

class SearchInProgressHalf extends StatefulWidget {
  const SearchInProgressHalf({Key? key, required this.initialTabIndex}) : super(key: key);

  final int initialTabIndex;

  @override
  SearchInProgressHalfState createState() => SearchInProgressHalfState();
}

class SearchInProgressHalfState extends State<SearchInProgressHalf> with TickerProviderStateMixin {
  late TabController tabviewController;

  TextEditingController searchController = TextEditingController();

  int selectedChipIndex = 0;
  int _currentIndexx = 0;


  String _query = '';
  List searchItem = [];

  ProviderServices? providerServices;


  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getAllPropertiesList();
    providerServices?.getAllVehiclesList();
    providerServices?.getAllFlightsList();
    providerServices?.getAllToursList();
    providerServices?.getAllServicesList();

    tabviewController = TabController(length: 5, vsync: this, initialIndex: widget.initialTabIndex);
    super.initState();
    searchItem.clear();
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    searchItem.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  onChanged: (v) {
                    // searchItem.clear();
                    setState(() => _query = v);

                  },
                  hintText: "Search Your Places",
                  suffix: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Container(
                            height: MediaQuery.of(context).size.height - 300,
                            child: SearchFilterBottomsheet(),
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 7.v, 11.h, 7.v),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgFilterlist,
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.v),
              _buildTabview(context),
              SizedBox(height: 24.v),
              _buildFilteredThirty(context),
              Expanded(
                child: SizedBox(
                  height: 740.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [

                      _buildSearch(context),
                      _buildSearch(context),
                      _buildSearch(context),
                      _buildSearch(context),
                      _buildSearch(context),


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
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
        text: "My Booking",
        margin: EdgeInsets.only(left: 14.h),
      ),
    );
  }

  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 37.v,
      width: 384.h,
      margin: EdgeInsets.only(left: 15.h),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.onPrimary.withOpacity(1),
        labelStyle: TextStyle(fontSize: 14.fSize, fontFamily: 'Inter', fontWeight: FontWeight.w500),
        unselectedLabelColor: theme.colorScheme.primary,
        unselectedLabelStyle: TextStyle(fontSize: 14.fSize, fontFamily: 'Inter', fontWeight: FontWeight.w500),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(18.h),
        ),
        tabs: [
          Tab(child: Text("Accommodation")),
          Tab(child: Text("Cars")),
          Tab(child: Text("Flights")),
          Tab(child: Text("Tours")),
          Tab(child: Text("Services")),
        ],
      ),
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
                    child: SearchFilterBottomsheet(),
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
        return _performAccommodationSearch(context);
      case 1:
        return _performCarsSearch(context);
      case 2:
        return _performFlightsSearch(context);
      case 3:
        return _performToursSearch(context);
      case 4:
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
          itemCount: provider.propertyListModel?.result!.where(
                (element) => element.hostName!
                .toLowerCase()
                .contains(_query.toLowerCase()),
          )?.length ?? 0,
          itemBuilder: (context, index) {
            final List<PropertyModel>? filteredList =
            provider.propertyListModel?.result
                ?.where((element) =>
                element.hostName!
                    .toLowerCase()
                    .contains(_query.toLowerCase()))
                .toList();

            if (filteredList != null && index < filteredList.length) {
              final PropertyModel currentItem = filteredList[index];
              return HomesectionItemWidget(
                onTapImgSpain: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HotelDetail(property: currentItem),
                    ),
                  );
                },
                property: currentItem,
              );
            } else {
              return SearchItemWidget();
            }
          },
        );
      },
    );
  }


  Widget _performCarsSearch(BuildContext context) {
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
          itemCount: provider.vehicleListModel?.result?.where(
                (element) => element.hostName!
                .toLowerCase()
                .contains(_query.toLowerCase()),
          )?.length ?? 0,
          itemBuilder: (context, index) {
            final List<VehicleModel>? filteredList =
            provider.vehicleListModel?.result
                ?.where((element) =>
                element.hostName!
                    .toLowerCase()
                    .contains(_query.toLowerCase()))
                .toList();

            if (filteredList != null && index < filteredList.length) {
              final VehicleModel currentItem = filteredList[index];
              return VehiclesectionItemWidget(
                onTapImgSpain: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VehicleDetail(vehicle: currentItem),
                    ),
                  );
                },
                vehicle: currentItem,
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
          itemCount: provider.flightListModel?.result?.where(
                (element) => element.toWhere!
                .toLowerCase()
                .contains(_query.toLowerCase()),
          )?.length ?? 0,
          itemBuilder: (context, index) {
            final List<FlightModel>? filteredList =
            provider.flightListModel?.result
                ?.where((element) =>
                element.hostName!
                    .toLowerCase()
                    .contains(_query.toLowerCase()))
                .toList();

            if (filteredList != null && index < filteredList.length) {
              final FlightModel currentItem = filteredList[index];
              return FlightsectionItemWidget(
                onTapImgSpain: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FlightDetail(flight: currentItem),
                    ),
                  );
                },
                flight: currentItem,
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
          itemCount: provider.tourListModel?.result?.where(
                (element) => element.hostName!
                .toLowerCase()
                .contains(_query.toLowerCase()),
          )?.length ?? 0,
          itemBuilder: (context, index) {
            final List<TourModel>? filteredList =
            provider.tourListModel?.result
                ?.where((element) =>
                element.hostName!
                    .toLowerCase()
                    .contains(_query.toLowerCase()))
                .toList();

            if (filteredList != null && index < filteredList.length) {
              final TourModel currentItem = filteredList[index];
              return ToursectionItemWidget(
                onTapImgSpain: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TourDetail(tour: currentItem),
                    ),
                  );
                },
                tour: currentItem,
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
          itemCount: provider.serviceListModel?.result?.where(
                (element) => element.hostName!
                .toLowerCase()
                .contains(_query.toLowerCase()),
          )?.length ?? 0,
          itemBuilder: (context, index) {
            final List<ServicesModel>? filteredList =
            provider.serviceListModel?.result
                ?.where((element) =>
                element.hostName!
                    .toLowerCase()
                    .contains(_query.toLowerCase()))
                .toList();

            if (filteredList != null && index < filteredList.length) {
              final ServicesModel currentItem = filteredList[index];
              return ServicesectionItemWidget(
                onTapImgSpain: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceDetail(service: currentItem),
                    ),
                  );
                },
                service: currentItem,
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

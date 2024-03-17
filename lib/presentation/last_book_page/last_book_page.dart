import 'package:kuddle_s_application27/models/booking_response.dart';
import 'package:kuddle_s_application27/presentation/last_book_page/widgets/lastbook_flight_widget.dart';
import 'package:kuddle_s_application27/presentation/last_book_page/widgets/lastbook_service_widget.dart';
import 'package:kuddle_s_application27/presentation/last_book_page/widgets/lastbook_tour_widget.dart';
import 'package:kuddle_s_application27/presentation/last_book_page/widgets/lastbook_vehicle_widget.dart';
import 'package:provider/provider.dart';
import '../../models/flight_response.dart';
import '../../models/tour_response.dart';
import '../../models/vehicle_response.dart';
import '../../models/service_response.dart';
import '../../pages/bookings/model/booking_model.dart';
import '../../services/provider/provider_services.dart';
import '../last_book_page/widgets/lastbook_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore_for_file: must_be_immutable
class LastBookPage extends StatefulWidget {
  const LastBookPage({Key? key})
      : super(
          key: key,
        );

  @override
  LastBookPageState createState() => LastBookPageState();
}



class LastBookPageState extends State<LastBookPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<LastBookPage> {
  ProviderServices? providerServices;
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    tabController = TabController(length: 5, vsync: this);
    providerServices?.getAllBookingsList();
    providerServices?.getAllBookedVehiclesList();
    providerServices?.getAllBookedFlightsList();
    providerServices?.getAllBookedToursList();
    providerServices?.getAllBookedServicesList();
    super.initState();
  }


  @override
  void dispose() {
    // Dispose of the tab controller when the widget is disposed
    tabController.dispose();
    super.dispose();
  }
  @override
  bool get wantKeepAlive => true;
  @override


  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.v),
              // Divider(color: Colors.black12,),
              SizedBox(height: 24.v),
              _buildTabview(context),
              Divider(color: Colors.black12,),
              SizedBox(height: 24.v),
              Expanded(
                child: SizedBox(
                  height: 740.v,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      _buildLastBook(context),
                      _buildLastVehicle(context),
                      _buildLastFlight(context),
                      _buildLastTour(context),
                      _buildLastService(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 50.v,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(12.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: tabController,
        labelPadding: EdgeInsets.zero,
        labelColor: Colors.blue,
        labelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: Colors.white.withOpacity(0.7),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.h),
        ),
        tabs: [
          Tab(child: Text("Hotel")),
          Tab(child: Text("Vehicles")),
          Tab(child: Text("Flights")),
          Tab(child: Text("Tours")),
          Tab(child: Text("Services")),
        ],
      ),
    );
  }


  // Widget build(BuildContext context) {
  //   mediaQueryData = MediaQuery.of(context);
  //
  //   return SafeArea(
  //     child: Scaffold(
  //       body: Container(
  //         width: double.maxFinite,
  //         decoration: AppDecoration.fillOnPrimary,
  //         child: Column(
  //           children: [
  //
  //             SizedBox(height: 30.v),
  //             // _buildHomeSection(context),
  //             _buildLastBook(context),
  //             SizedBox(height: 30.v),
  //
  //             Text('Vehicles',style: TextStyle(fontSize: 18),),
  //             _buildLastVehicle(context)
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// Section Widget
  // Widget _buildLastBook(BuildContext context) {
  //   return Expanded(
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 15.h),
  //       child: ListView.separated(
  //         physics: BouncingScrollPhysics(),
  //         shrinkWrap: true,
  //         separatorBuilder: (
  //           context,
  //           index,
  //         ) {
  //           return SizedBox(
  //             height: 20.v,
  //           );
  //         },
  //         itemCount: 4,
  //         itemBuilder: (context, index) {
  //           return LastbookItemWidget();
  //         },
  //       ),
  //     ),
  //   );
  // }



  // Widget _buildHomeSection(BuildContext context) {
  //   return Consumer<ProviderServices>(
  //     builder: (_, provider, __) {
  //       if ( provider.bookingListModel!.result == null) {
  //         return Center(child: CircularProgressIndicator());
  //       } else {
  //         List<BookingModel> items = provider.bookingListModel!.result!;
  //
  //         return SizedBox(
  //           height: 219,
  //           child: ListView.separated(
  //             scrollDirection: Axis.horizontal,
  //             separatorBuilder: (context, index) {
  //               return SizedBox(width: 15);
  //             },
  //             itemCount: items.length,
  //             itemBuilder: (context, index) {
  //               // Use Padding outside the Expanded, not inside
  //               return Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 15),
  //                 child: SizedBox(
  //                   width: 300, // Adjust the width as needed
  //                   child: ListView.separated(
  //                     physics: BouncingScrollPhysics(),
  //                     shrinkWrap: true,
  //                     separatorBuilder: (context, index) {
  //                       return SizedBox(height: 20);
  //                     },
  //                     itemCount: items.length,
  //                     itemBuilder: (context, index) {
  //                       BookingModel currentItem = items[index];
  //                       return LastbookItemWidget(bookingRoom: currentItem);
  //                     },
  //                   ),
  //                 ),
  //               );
  //             },
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }



  Widget _buildLastBook(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        // Check if provider or bookRoomListModel is null before accessing data
        if (provider.bookingResponse?.result == null) {
          return Center(child: const CircularProgressIndicator());
        }

        List<Booking>? items = provider.bookingResponse?.result;

        if (items == null || items.isEmpty) {
          return Center(
            child: Text(
              'No Results',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
                context,
                index,
                ) {
              return SizedBox(
                height: 20.v,
              );
            },
            itemCount: items?.length ?? 0,
            itemBuilder: (context, index) {
              // Customize based on the current item if needed
              Booking currentItem = items![index];

              return LastbookItemWidget(bookRoom: currentItem);
            },
          ),
        );
      },
    );
  }


  Widget _buildLastVehicle(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        // Check if provider or vehicleResponse is null before accessing data
        if (provider.vehicleResponse?.status != "Success") {

          return Center(child: const CircularProgressIndicator());
        }

        List<Vehicle>? items = provider.vehicleResponse?.result;

        // Check if the list is empty and display a "No Results" widget
        if (items == null || items.isEmpty) {
          return Center(
            child: Text(
              'No Results',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
                context,
                index,
                ) {
              return SizedBox(
                height: 20.v,
              );
            },
            itemCount: items.length,
            itemBuilder: (context, index) {
              // Customize based on the current item if needed
              Vehicle currentItem = items[index];

              return LastbookVehicleWidget(vehicle: currentItem);
            },
          ),
        );
      },
    );
  }



  Widget _buildLastFlight(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        // Check if provider or bookRoomListModel is null before accessing data
        if (provider.flightResponse?.result == null) {
          return Center(child: const CircularProgressIndicator());
        }

        List<Flight>? items = provider.flightResponse?.result;


        if (items == null || items.isEmpty) {
          return Center(
            child: Text(
              'No Results',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
                context,
                index,
                ) {
              return SizedBox(
                height: 20.v,
              );
            },
            itemCount: items?.length ?? 0,
            itemBuilder: (context, index) {
              // Customize based on the current item if needed
              Flight currentItem = items![index];

              return LastbookFlightWidget(bookRoom: currentItem);
            },
          ),
        );
      },
    );
  }



  Widget _buildLastTour(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        // Check if provider or bookRoomListModel is null before accessing data
        if (provider.tourResponse?.result == null) {
          return Center(child: const CircularProgressIndicator());
        }

        List<Tour>? items = provider.tourResponse?.result;

        if (items == null || items.isEmpty) {
          return Center(
            child: Text(
              'No Results',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
                context,
                index,
                ) {
              return SizedBox(
                height: 20.v,
              );
            },
            itemCount: items?.length ?? 0,
            itemBuilder: (context, index) {
              // Customize based on the current item if needed
              Tour currentItem = items![index];

              return LastbookTourWidget(bookRoom: currentItem);
            },
          ),
        );
      },
    );
  }

  Widget _buildLastService(BuildContext context) {
    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        // Check if provider or bookRoomListModel is null before accessing data
        if (provider.serviceResponse?.result == null) {
          return Center(child: const CircularProgressIndicator());
        }

        List<Service>? items = provider.serviceResponse?.result;

        if (items == null || items.isEmpty) {
          return Center(
            child: Text(
              'No Results',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
                context,
                index,
                ) {
              return SizedBox(
                height: 20.v,
              );
            },
            itemCount: items?.length ?? 0,
            itemBuilder: (context, index) {
              // Customize based on the current item if needed
              Service currentItem = items![index];

              return LastbookServiceWidget(bookRoom: currentItem);
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/last_book_complete_page/last_book_complete_page.dart';
import 'package:kuddle_s_application27/presentation/last_book_page/last_book_page.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';

class LastBookTabContainerPage extends StatefulWidget {
 const LastBookTabContainerPage({Key? key}) : super(key: key);

 @override
 LastBookTabContainerPageState createState() =>
     LastBookTabContainerPageState();
}

// ignore_for_file: must_be_immutable
class LastBookTabContainerPageState extends State<LastBookTabContainerPage>
    with TickerProviderStateMixin {
 late TabController tabviewController;

 @override
 void initState() {
  super.initState();
  tabviewController = TabController(length: 4, vsync: this);
 }

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: SizedBox(
              width: double.maxFinite,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   SizedBox(height: 24.v),
                   _buildTabview(context),
                   Expanded(
                       child: SizedBox(
                           height: 740.v,
                           child: TabBarView(
                               controller: tabviewController,
                               children: [
                                LastBookPage(),
                                LastBookPage(),
                                 Center(child: Text('No completed bookings yet')),
                                 Center(child: Text('No cancelled bookings yet'))
                               ])))
                  ]))));
 }

 /// Section Widget
 PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
          // imagePath: ImageConstant.imgArrowLeftPrimary,
          margin: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 12.v),
          onTap: () {
           // onTapArrowLeft(context);
          }),
      title: AppbarTitle(
          text: "My Booking", margin: EdgeInsets.only(left: 14.h)));
 }

 /// Section Widget
 Widget _buildTabview(BuildContext context) {
  return Container(
      height: 37.v,
      // width: 384.h,
      margin: EdgeInsets.only(left: 15.h),
      child: TabBar(
          controller: tabviewController,
          labelPadding: EdgeInsets.zero,
          labelColor: theme.colorScheme.onPrimary.withOpacity(1),
          labelStyle: TextStyle(
              fontSize: 14.fSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500),
          unselectedLabelColor: theme.colorScheme.primary,
          unselectedLabelStyle: TextStyle(
              fontSize: 14.fSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500),
          indicator: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(18.h)),
          tabs: [
           Tab(child: Text("All")),
           Tab(child: Text("Ongoing")),
           Tab(child: Text("Completed")),
           Tab(child: Text("Canceled"))
          ]));
 }

 /// Navigates back to the previous screen.
 onTapArrowLeft(BuildContext context) {
  Navigator.pop(context);
 }
}

import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/last_book_complete_page/last_book_complete_page.dart';
import 'package:kuddle_s_application27/presentation/last_book_page/last_book_page.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';

import '../../widgets/custom_search_view.dart';
import '../search_filter_bottomsheet/search_filter_bottomsheet.dart';
import '../search_page/widgets/search_item_widget.dart';

class SearchesPage extends StatefulWidget {
 const SearchesPage({Key? key, required this.initialTabIndex}) : super(key: key);

  final int initialTabIndex;

 @override
 SearchesPageState createState() =>
     SearchesPageState();
}

// ignore_for_file: must_be_immutable
class SearchesPageState extends State<SearchesPage>
    with TickerProviderStateMixin {
 late TabController tabviewController;


 @override
 void initState() {
  super.initState();
  tabviewController = TabController(length: 4, vsync: this,initialIndex: widget.initialTabIndex);

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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: CustomSearchView(
                        width: 900,
                        // controller: searchController,
                        hintText: "Search Your Placess",
                        suffix: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true, // Set to true for a full-screen modal
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height - 300,
                                  // Adjust the height as needed
                                  child: SearchFilterBottomsheet(),
                                );
                              }, // Corrected this line
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
                                LastBookCompletePage(),
                                LastBookPage()
                               ])))
                  ]))));
 }

 /// Section Widget
 PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgArrowLeftPrimary,
          margin: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 12.v),
          onTap: () {
           onTapArrowLeft(context);
          }),
      title: AppbarTitle(
          text: "My Booking", margin: EdgeInsets.only(left: 14.h)));
 }

 /// Section Widget
 Widget _buildTabview(BuildContext context) {
  return Container(
      height: 37.v,
      width: 384.h,
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
           Tab(child: Text("Accomodation")),
           Tab(child: Text("Cars")),
           Tab(child: Text("Flights")),
           Tab(child: Text("Tours"))
          ]));
 }

 /// Section Widget
 Widget _buildFilteredThirty(BuildContext context) {
   return Padding(
     // padding: EdgeInsets.only(left: 1.h),
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
           onTap: (){

             showModalBottomSheet(
               context: context,
               isScrollControlled: true, // Set to true for a full-screen modal
               builder: (BuildContext context) {
                 return Container(
                   height: MediaQuery.of(context).size.height - 250,
                   // Adjust the height as needed
                   child: SearchFilterBottomsheet(),
                 );
               }, // Corrected this line
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
   return ListView.separated(
     physics: BouncingScrollPhysics(),
     shrinkWrap: true,
     separatorBuilder: (
         context,
         index,
         ) {
       return SizedBox(
         height: 19.v,
       );
     },
     itemCount: 6,
     itemBuilder: (context, index) {
       return SearchItemWidget();
     },
   );
 }
 /// Navigates back to the previous screen.
 onTapArrowLeft(BuildContext context) {
  Navigator.pop(context);
 }
}

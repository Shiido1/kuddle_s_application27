import '../favorite_two_screen/widgets/favoritetwo_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/car_page/car_page.dart';
import 'package:kuddle_s_application27/presentation/favorite_page/favorite_page.dart';
import 'package:kuddle_s_application27/presentation/last_book_tab_container_page/last_book_tab_container_page.dart';
import 'package:kuddle_s_application27/presentation/profile_one_page/profile_one_page.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_trailing_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_bottom_app_bar.dart';

// ignore_for_file: must_be_immutable
class FavoriteTwoScreen extends StatelessWidget {
 FavoriteTwoScreen({Key? key}) : super(key: key);

 GlobalKey<NavigatorState> navigatorKey = GlobalKey();

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: SizedBox(
              width: double.maxFinite,
              child: Column(children: [
               SizedBox(height: 24.v),
               _buildFavoriteTwo(context)
              ])),
          bottomNavigationBar: _buildHome(context),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked));
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
      title:
      AppbarTitle(text: "Favorites", margin: EdgeInsets.only(left: 14.h)),
      actions: [
       AppbarTrailingImage(
           imagePath: ImageConstant.imgVuesaxLinearElement3,
           margin: EdgeInsets.only(left: 15.h, top: 16.v, right: 15.h)),
       AppbarTrailingImage(
           imagePath: ImageConstant.imgVuesaxLinearFatrows,
           margin: EdgeInsets.only(left: 11.h, top: 16.v, right: 30.h))
      ]);
 }

 /// Section Widget
 Widget _buildFavoriteTwo(BuildContext context) {
  return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
               return SizedBox(height: 20.v);
              },
              itemCount: 6,
              itemBuilder: (context, index) {
               return FavoritetwoItemWidget();
              })));
 }

 /// Section Widget
 Widget _buildHome(BuildContext context) {
  return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
   Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
  });
 }

 ///Handling route based on bottom click actions
 String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
   case BottomBarEnum.Home:
    return AppRoutes.carPage;
   case BottomBarEnum.Vuesaxlinearheart:
    return AppRoutes.favoritePage;
   case BottomBarEnum.Bag:
    return AppRoutes.lastBookTabContainerPage;
   case BottomBarEnum.User:
    return AppRoutes.profileOnePage;
   default:
    return "/";
  }
 }

 ///Handling page based on route
 Widget getCurrentPage(String currentRoute) {
  switch (currentRoute) {
   case AppRoutes.carPage:
    return CarPage();
   case AppRoutes.favoritePage:
    return FavoritePage();
   case AppRoutes.lastBookTabContainerPage:
    return LastBookTabContainerPage();
   case AppRoutes.profileOnePage:
    return ProfileOnePage();
   default:
    return DefaultWidget();
  }
 }

 /// Navigates back to the previous screen.
 onTapArrowLeft(BuildContext context) {
  Navigator.pop(context);
 }
}

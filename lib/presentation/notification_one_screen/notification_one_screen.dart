import 'package:flutter/material.dart';import 'package:kuddle_s_application27/core/app_export.dart';import 'package:kuddle_s_application27/presentation/car_page/car_page.dart';import 'package:kuddle_s_application27/presentation/favorite_page/favorite_page.dart';import 'package:kuddle_s_application27/presentation/last_book_tab_container_page/last_book_tab_container_page.dart';import 'package:kuddle_s_application27/presentation/profile_one_page/profile_one_page.dart';import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';import 'package:kuddle_s_application27/widgets/custom_bottom_app_bar.dart';import 'package:kuddle_s_application27/widgets/custom_switch.dart';
// ignore_for_file: must_be_immutable
class NotificationOneScreen extends StatelessWidget {NotificationOneScreen({Key? key}) : super(key: key);

bool isSelectedSwitch = false;

bool isSelectedSwitch1 = false;

bool isSelectedSwitch2 = false;

bool isSelectedSwitch3 = false;

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(appBar: _buildAppBar(context), body: SizedBox(width: double.maxFinite, child: Column(children: [SizedBox(height: 44.v), Expanded(child: SingleChildScrollView(child: _buildNotificationOne(context)))])), bottomNavigationBar: _buildHome(context), floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked)); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(leadingWidth: 46.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgArrowLeftPrimary, margin: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 12.v), onTap: () {onTapArrowLeft(context);}), title: AppbarTitle(text: "Notification", margin: EdgeInsets.only(left: 14.h))); } 
/// Section Widget
Widget _buildNotificationOne(BuildContext context) { return Padding(padding: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 599.v), child: Column(children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Padding(padding: EdgeInsets.only(bottom: 1.v), child: Text("General Notification", style: theme.textTheme.titleMedium)), CustomSwitch(value: isSelectedSwitch, onChange: (value) {isSelectedSwitch = value;})]), SizedBox(height: 25.v), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Sound", style: theme.textTheme.titleMedium), CustomSwitch(value: isSelectedSwitch1, onChange: (value) {isSelectedSwitch1 = value;})]), SizedBox(height: 24.v), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Padding(padding: EdgeInsets.only(bottom: 1.v), child: Text("Vibration", style: theme.textTheme.titleMedium)), CustomSwitch(value: isSelectedSwitch2, onChange: (value) {isSelectedSwitch2 = value;})]), SizedBox(height: 24.v), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Padding(padding: EdgeInsets.only(bottom: 1.v), child: Text("New Services", style: theme.textTheme.titleMedium)), CustomSwitch(value: isSelectedSwitch3, onChange: (value) {isSelectedSwitch3 = value;})])])); } 
/// Section Widget
Widget _buildHome(BuildContext context) { return CustomBottomAppBar(onChanged: (BottomBarEnum type) {Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));}); } 
///Handling route based on bottom click actions
String getCurrentRoute(BottomBarEnum type) { switch (type) {case BottomBarEnum.Home: return AppRoutes.carPage; case BottomBarEnum.Vuesaxlinearheart: return AppRoutes.favoritePage; case BottomBarEnum.Bag: return AppRoutes.lastBookTabContainerPage; case BottomBarEnum.User: return AppRoutes.profileOnePage; default: return "/";} } 
///Handling page based on route
Widget getCurrentPage(String currentRoute) { switch (currentRoute) {case AppRoutes.carPage: return CarPage(); case AppRoutes.favoritePage: return FavoritePage(); case AppRoutes.lastBookTabContainerPage: return LastBookTabContainerPage(); case AppRoutes.profileOnePage: return ProfileOnePage(); default: return DefaultWidget();} } 

/// Navigates back to the previous screen.
onTapArrowLeft(BuildContext context) { Navigator.pop(context); } 
 }

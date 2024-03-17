import 'package:flutter/material.dart';import 'package:kuddle_s_application27/core/app_export.dart';import 'package:kuddle_s_application27/presentation/car_page/car_page.dart';import 'package:kuddle_s_application27/presentation/favorite_page/favorite_page.dart';import 'package:kuddle_s_application27/presentation/last_book_tab_container_page/last_book_tab_container_page.dart';import 'package:kuddle_s_application27/presentation/profile_one_page/profile_one_page.dart';import 'package:kuddle_s_application27/widgets/custom_bottom_app_bar.dart';
// ignore_for_file: must_be_immutable
class CarContainerScreen extends StatelessWidget {CarContainerScreen({Key? key}) : super(key: key);

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(body: Navigator(key: navigatorKey, initialRoute: AppRoutes.carPage, onGenerateRoute: (routeSetting) => PageRouteBuilder(pageBuilder: (ctx, ani, ani1) => getCurrentPage(routeSetting.name!), transitionDuration: Duration(seconds: 0))), bottomNavigationBar: _buildHome(context), floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked)); } 
/// Section Widget
Widget _buildHome(BuildContext context) { return CustomBottomAppBar(onChanged: (BottomBarEnum type) {Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));}); } 
///Handling route based on bottom click actions
String getCurrentRoute(BottomBarEnum type) { switch (type) {case BottomBarEnum.Home: return AppRoutes.carPage; case BottomBarEnum.Vuesaxlinearheart: return AppRoutes.favoritePage; case BottomBarEnum.Bag: return AppRoutes.lastBookTabContainerPage; case BottomBarEnum.User: return AppRoutes.profileOnePage; default: return "/";} } 
///Handling page based on route
Widget getCurrentPage(String currentRoute) { switch (currentRoute) {case AppRoutes.carPage: return CarPage(); case AppRoutes.favoritePage: return FavoritePage(); case AppRoutes.lastBookTabContainerPage: return LastBookTabContainerPage(); case AppRoutes.profileOnePage: return ProfileOnePage(); default: return DefaultWidget();} } 
 }

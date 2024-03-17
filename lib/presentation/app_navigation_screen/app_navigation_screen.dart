import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "splash - One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.splashOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "MENU LINK",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.menuLinkScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "splash - Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.splashTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "splash - Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.splashThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "splash - Four",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.splashFourScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.loginPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign up",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign in",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signInScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notifications",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "favorite Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.favoriteThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Hotel Six",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.hotelSixScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Book Room Calendar",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.bookRoomCalendarScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Car - Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.carContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Search One - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.searchOneTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "favorite Four",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.favoriteFourScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Hotel Five",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.hotelFiveScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Book Room Calendar Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.bookRoomCalendarTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Flights - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.flightsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "favorite One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.favoriteOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Hotel",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.hotelScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Book Room Calendar Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.bookRoomCalendarThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Hotel Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.hotelThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Book Room Calendar One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.bookRoomCalendarOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "other service",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.otherServiceScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Search - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.searchTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "favorite Five",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.favoriteFiveScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Book Room details",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.bookRoomDetailsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "payment option One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentOptionOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add Payment card",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addPaymentCardScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "payment option",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentOptionScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "payment sucess",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentSucessScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "payment fail",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentFailScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "favorite Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.favoriteTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "View Booking One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.viewBookingOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "contact-host",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.contactHostScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "View Booking",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.viewBookingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "E-wallet",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.eWalletScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notification One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notification",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationScreen),
                        ),
                      ],
                    ),
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
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}

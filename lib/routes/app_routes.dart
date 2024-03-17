import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/presentation/splash_one_screen/splash_one_screen.dart';
import 'package:kuddle_s_application27/presentation/menu_link_screen/menu_link_screen.dart';
import 'package:kuddle_s_application27/presentation/splash_two_screen/splash_two_screen.dart';
import 'package:kuddle_s_application27/presentation/splash_three_screen/splash_three_screen.dart';
import 'package:kuddle_s_application27/presentation/splash_four_screen/splash_four_screen.dart';
import 'package:kuddle_s_application27/presentation/login_page_screen/login_page_screen.dart';
import 'package:kuddle_s_application27/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:kuddle_s_application27/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:kuddle_s_application27/presentation/notifications_screen/notifications_screen.dart';
import 'package:kuddle_s_application27/presentation/favorite_three_screen/favorite_three_screen.dart';
import 'package:kuddle_s_application27/presentation/hotel_six_screen/hotel_six_screen.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_screen/book_room_calendar_screen.dart';
import 'package:kuddle_s_application27/presentation/car_container_screen/car_container_screen.dart';
import 'package:kuddle_s_application27/presentation/search_one_tab_container_screen/search_one_tab_container_screen.dart';
import 'package:kuddle_s_application27/presentation/favorite_four_screen/favorite_four_screen.dart';
import 'package:kuddle_s_application27/presentation/hotel_five_screen/hotel_five_screen.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_two_screen/book_room_calendar_two_screen.dart';
import 'package:kuddle_s_application27/presentation/flights_tab_container_screen/flights_tab_container_screen.dart';
import 'package:kuddle_s_application27/presentation/favorite_one_screen/favorite_one_screen.dart';
import 'package:kuddle_s_application27/presentation/hotel_screen/hotel_screen.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_three_screen/book_room_calendar_three_screen.dart';
import 'package:kuddle_s_application27/presentation/hotel_three_screen/hotel_three_screen.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_one_screen/book_room_calendar_one_screen.dart';
import 'package:kuddle_s_application27/presentation/other_service_screen/other_service_screen.dart';
import 'package:kuddle_s_application27/presentation/search_tab_container_screen/search_tab_container_screen.dart';
import 'package:kuddle_s_application27/presentation/favorite_five_screen/favorite_five_screen.dart';
import 'package:kuddle_s_application27/presentation/book_room_details_screen/book_room_details_screen.dart';
import 'package:kuddle_s_application27/presentation/payment_option_one_screen/payment_option_one_screen.dart';
import 'package:kuddle_s_application27/presentation/add_payment_card_screen/add_payment_card_screen.dart';
import 'package:kuddle_s_application27/presentation/payment_option_screen/payment_option_screen.dart';
import 'package:kuddle_s_application27/presentation/payment_sucess_screen/payment_sucess_screen.dart';
import 'package:kuddle_s_application27/presentation/payment_fail_screen/payment_fail_screen.dart';
import 'package:kuddle_s_application27/presentation/favorite_two_screen/favorite_two_screen.dart';
import 'package:kuddle_s_application27/presentation/view_booking_one_screen/view_booking_one_screen.dart';
import 'package:kuddle_s_application27/presentation/contact_host_screen/contact_host_screen.dart';
import 'package:kuddle_s_application27/presentation/view_booking_screen/view_booking_screen.dart';
import 'package:kuddle_s_application27/presentation/e_wallet_screen/e_wallet_screen.dart';
import 'package:kuddle_s_application27/presentation/profile_screen/profile_screen.dart';
import 'package:kuddle_s_application27/presentation/notification_one_screen/notification_one_screen.dart';
import 'package:kuddle_s_application27/presentation/notification_screen/notification_screen.dart';
import 'package:kuddle_s_application27/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashOneScreen = '/splash_one_screen';

  static const String menuLinkScreen = '/menu_link_screen';

  static const String splashTwoScreen = '/splash_two_screen';

  static const String splashThreeScreen = '/splash_three_screen';

  static const String splashFourScreen = '/splash_four_screen';

  static const String loginPageScreen = '/login_page_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String homePage = '/home_page';

  static const String notificationsScreen = '/notifications_screen';

  static const String searchTwoPage = '/search_two_page';

  static const String favoriteThreeScreen = '/favorite_three_screen';

  static const String hotelSixScreen = '/hotel_six_screen';

  static const String bookRoomCalendarScreen = '/book_room_calendar_screen';

  static const String carPage = '/car_page';

  static const String carContainerScreen = '/car_container_screen';

  static const String searchOnePage = '/search_one_page';

  static const String searchOneTabContainerScreen =
      '/search_one_tab_container_screen';

  static const String searchFilterOnePage = '/search_filter_one_page';

  static const String favoriteFourScreen = '/favorite_four_screen';

  static const String hotelFiveScreen = '/hotel_five_screen';

  static const String bookRoomCalendarTwoScreen =
      '/book_room_calendar_two_screen';

  static const String flightsPage = '/flights_page';

  static const String flightsTabContainerScreen =
      '/flights_tab_container_screen';

  static const String searchThreePage = '/search_three_page';

  static const String searchFilterThreePage = '/search_filter_three_page';

  static const String favoriteOneScreen = '/favorite_one_screen';

  static const String hotelScreen = '/hotel_screen';

  static const String bookRoomCalendarThreeScreen =
      '/book_room_calendar_three_screen';

  static const String hotelThreeScreen = '/hotel_three_screen';

  static const String bookRoomCalendarOneScreen =
      '/book_room_calendar_one_screen';

  static const String otherServiceScreen = '/other_service_screen';

  static const String searchPage = '/search_page';

  static const String searchTabContainerScreen = '/search_tab_container_screen';

  static const String searchFilterTwoPage = '/search_filter_two_page';

  static const String favoriteFiveScreen = '/favorite_five_screen';

  static const String bookRoomDetailsScreen = '/book_room_details_screen';

  static const String paymentOptionOneScreen = '/payment_option_one_screen';

  static const String addPaymentCardScreen = '/add_payment_card_screen';

  static const String paymentOptionScreen = '/payment_option_screen';

  static const String paymentSucessScreen = '/payment_sucess_screen';

  static const String paymentFailScreen = '/payment_fail_screen';

  static const String favoritePage = '/favorite_page';

  static const String favoriteTwoScreen = '/favorite_two_screen';

  static const String lastBookOngoingPage = '/last_book_ongoing_page';

  static const String viewBookingOneScreen = '/view_booking_one_screen';

  static const String contactHostScreen = '/contact_host_screen';

  static const String viewBookingScreen = '/view_booking_screen';

  static const String lastBookCompletePage = '/last_book_complete_page';

  static const String lastBookPage = '/last_book_page';

  static const String lastBookTabContainerPage =
      '/last_book_tab_container_page';

  static const String profileOnePage = '/profile_one_page';

  static const String eWalletScreen = '/e_wallet_screen';

  static const String profileScreen = '/profile_screen';

  static const String notificationOneScreen = '/notification_one_screen';

  static const String notificationScreen = '/notification_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashOneScreen: (context) => SplashOneScreen(),
    menuLinkScreen: (context) => MenuLinkScreen(),
    splashTwoScreen: (context) => SplashTwoScreen(),
    splashThreeScreen: (context) => SplashThreeScreen(),
    splashFourScreen: (context) => SplashFourScreen(),
    loginPageScreen: (context) => LoginPageScreen(),
    signUpScreen: (context) => SignUpScreen(),
    signInScreen: (context) => SignInScreen(),
    notificationsScreen: (context) => NotificationsScreen(),
    favoriteThreeScreen: (context) => FavoriteThreeScreen(),
    hotelSixScreen: (context) => HotelSixScreen(),
    bookRoomCalendarScreen: (context) => BookRoomCalendarScreen(),
    carContainerScreen: (context) => CarContainerScreen(),
    searchOneTabContainerScreen: (context) => SearchOneTabContainerScreen(),
    favoriteFourScreen: (context) => FavoriteFourScreen(),
    // hotelFiveScreen: (context) => HotelFiveScreen(),
    bookRoomCalendarTwoScreen: (context) => BookRoomCalendarTwoScreen(),
    flightsTabContainerScreen: (context) => FlightsTabContainerScreen(),
    favoriteOneScreen: (context) => FavoriteOneScreen(),
    hotelScreen: (context) => HotelScreen(),
    bookRoomCalendarThreeScreen: (context) => BookRoomCalendarThreeScreen(),
    hotelThreeScreen: (context) => HotelThreeScreen(),
    bookRoomCalendarOneScreen: (context) => BookRoomCalendarOneScreen(),
    otherServiceScreen: (context) => OtherServiceScreen(),
    searchTabContainerScreen: (context) => SearchTabContainerScreen(),
    favoriteFiveScreen: (context) => FavoriteFiveScreen(),
    bookRoomDetailsScreen: (context) => BookRoomDetailsScreen(),
    paymentOptionOneScreen: (context) => PaymentOptionOneScreen(),
    addPaymentCardScreen: (context) => AddPaymentCardScreen(),
    paymentOptionScreen: (context) => PaymentOptionScreen(),
    paymentSucessScreen: (context) => PaymentSucessScreen(),
    paymentFailScreen: (context) => PaymentFailScreen(),
    favoriteTwoScreen: (context) => FavoriteTwoScreen(),
    viewBookingOneScreen: (context) => ViewBookingOneScreen(),
    contactHostScreen: (context) => ContactHostScreen(),
    viewBookingScreen: (context) => ViewBookingScreen(),
    eWalletScreen: (context) => EWalletScreen(),
    profileScreen: (context) => ProfileScreen(),
    notificationOneScreen: (context) => NotificationOneScreen(),
    notificationScreen: (context) => NotificationScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}

class HotelFiveScreen {

}

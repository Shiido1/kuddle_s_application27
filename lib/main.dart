import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive/hive.dart';
import 'package:kuddle_s_application27/apiservices/provider/provider.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_screen/buildBooking.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_screen/payment_choice_screen.dart';
import 'package:kuddle_s_application27/presentation/flights_tab_container_screen/flights_tab_container_screen.dart';
import 'package:kuddle_s_application27/presentation/home_page/bottombar.dart';
// import 'package:kuddle_s_application27/presentation/home_page%20copy/home_page.dart';
import 'package:kuddle_s_application27/presentation/home_page/home_page.dart';
import 'package:kuddle_s_application27/presentation/login_page_screen/login_page_screen.dart';
import 'package:kuddle_s_application27/presentation/payment_screen.dart';
import 'package:kuddle_s_application27/presentation/payment_sucess_screen/payment_sucess_screen.dart';
import 'package:kuddle_s_application27/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:kuddle_s_application27/presentation/splash_two_screen/splash_two_screen.dart';
import 'package:kuddle_s_application27/theme/theme_helper.dart';
import 'package:kuddle_s_application27/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';
import 'main_core/injector.dart';
import 'main_core/session_manager.dart';
import 'models/favourites.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeCore();
  // Register Hive adapter for Favorite
  Hive.registerAdapter(FavoriteAdapter());
  // Initialize Hive with Flutter support
  await Hive.initFlutter();
  await Hive.openBox<Favorite>('favoritesBox');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    ThemeHelper().changeTheme('primary');
    runApp( MyApp());
  });


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(SessionManager.instance.authToken);
    return MultiProvider(
      providers: Providers.getProviders,
      builder: (_, __) => MaterialApp(
        theme: theme,
        title: 'kuddle_s_application27',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primarySwatch: Colors.blue, // Change this color to your desired primary color
        // ),
        home:  SessionManager.instance.authToken.isNotEmpty
            ? HomePage(selectedIndex: 0)
            : const SplashTwoScreen(),
        // initialRoute: AppRoutes.splashOneScreen,h
        routes: AppRoutes.routes,
      ),
    );
  }
}

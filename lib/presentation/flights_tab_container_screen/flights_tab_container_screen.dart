import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/car_page/car_page.dart';
import 'package:kuddle_s_application27/presentation/favorite_page/favorite_page.dart';
import 'package:kuddle_s_application27/presentation/flights_page/flights_page.dart';
import 'package:kuddle_s_application27/presentation/home_page/home_page.dart';
import 'package:kuddle_s_application27/presentation/last_book_tab_container_page/last_book_tab_container_page.dart';
import 'package:kuddle_s_application27/presentation/profile_one_page/profile_one_page.dart';
import 'package:kuddle_s_application27/presentation/search_filter_three_page/search_filter_three_page.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_subtitle.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_bottom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_search_view.dart';

class FlightsTabContainerScreen extends StatefulWidget {
  const FlightsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  FlightsTabContainerScreenState createState() =>
      FlightsTabContainerScreenState();
}

class FlightsTabContainerScreenState extends State<FlightsTabContainerScreen>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 18.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 252.h,
                  margin: EdgeInsets.only(left: 15.h),
                  child: Text(
                    "Want to Fly like a King?",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headlineLarge!.copyWith(
                      height: 1.40,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: CustomSearchView(
                  controller: searchController,
                  hintText: "Search Your Place",
                ),
              ),
              SizedBox(height: 25.v),
              _buildTabview(context),
              Expanded(
                child: SizedBox(
                  height: 566.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      FlightsPage(),
                      FlightsPage(),
                      SearchFilterThreePage(),
                      FlightsPage(),
                      FlightsPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildHome(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgMenu,
        margin: EdgeInsets.only(
          left: 15.h,
          top: 19.v,
          bottom: 18.v,
        ),
      ),
      actions: [
        AppbarSubtitle(
          text: "1500.00",
          margin: EdgeInsets.fromLTRB(15.h, 16.v, 1.h, 15.v),
        ),
        AppbarTrailingCircleimage(
          imagePath: ImageConstant.imgEllipse3,
          margin: EdgeInsets.only(
            left: 6.h,
            top: 1.v,
            right: 16.h,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 37.v,
      width: 415.h,
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        labelColor: theme.colorScheme.onPrimary.withOpacity(1),
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: theme.colorScheme.primary,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            18.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "Hotel",
            ),
          ),
          Tab(
            child: Text(
              "Apartment",
            ),
          ),
          Tab(
            child: Text(
              "Car",
            ),
          ),
          Tab(
            child: Text(
              "Flights",
            ),
          ),
          Tab(
            child: Text(
              "Islands",
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHome(BuildContext context) {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
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
}

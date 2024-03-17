import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/search_one_page/search_one_page.dart';
import 'package:kuddle_s_application27/presentation/search_three_page/search_three_page.dart';
import 'package:kuddle_s_application27/presentation/search_two_page/search_two_page.dart';
import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';

import '../search_page/search_page.dart';

class SearchOneTabContainerScreen extends StatefulWidget {
  const SearchOneTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SearchOneTabContainerScreenState createState() =>
      SearchOneTabContainerScreenState();
}

class SearchOneTabContainerScreenState
    extends State<SearchOneTabContainerScreen> with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  late TabController tabviewController;

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
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 37.v),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.h,
                          right: 14.h,
                        ),
                        child: CustomTextFormField(
                          controller: searchController,
                          hintText: "Lee",
                          hintStyle: CustomTextStyles.titleSmall15_1,
                          textInputAction: TextInputAction.done,
                          prefix: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10.h,
                              vertical: 11.v,
                            ),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgSearch,
                              height: 22.adaptSize,
                              width: 22.adaptSize,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(
                            maxHeight: 44.v,
                          ),
                          suffix: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 30.h,
                              vertical: 10.v,
                            ),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgClosePrimary,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                          ),
                          suffixConstraints: BoxConstraints(
                            maxHeight: 44.v,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12.v),
                        ),
                      ),
                      SizedBox(height: 30.v),
                      _buildTabview(context),
                      Expanded(
                        child: SizedBox(
                          height: 825.v,
                          child: TabBarView(
                            controller: tabviewController,
                            children: [
                              SearchTwoPage(),
                              SearchPage(),
                              SearchOnePage(),
                              SearchThreePage(),
                              SearchThreePage(),
                            ],
                          ),
                        ),
                      ),
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
      height: 37.v,
      width: 416.h,
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
}

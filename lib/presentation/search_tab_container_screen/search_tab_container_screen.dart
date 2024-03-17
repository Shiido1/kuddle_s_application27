import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/search_page/search_page.dart';
import 'package:kuddle_s_application27/presentation/search_two_page/search_two_page.dart';
import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';

class SearchTabContainerScreen extends StatefulWidget {
  const SearchTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SearchTabContainerScreenState createState() =>
      SearchTabContainerScreenState();
}

class SearchTabContainerScreenState extends State<SearchTabContainerScreen>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 6, vsync: this);
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
                              SearchPage(),
                              SearchPage(),
                              SearchPage(),
                              SearchPage(),
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
   double chipSpacing = 6.0; // Adjust the spacing as needed
  Widget _buildChipView(BuildContext context) {
    return Container(
      height: 37.v,
      width: 413.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tabviewController.animateTo(index);
              setState(() {

              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: chipSpacing),
              child: RawChip(
                padding: EdgeInsets.symmetric(
                  horizontal: 19.h,
                  vertical: 10.v,
                ),
                label: Text(
                  getTabLabel(index),
                ),
                backgroundColor: tabviewController.index == index
                    ? theme.colorScheme.onPrimary.withOpacity(1)
                    : theme.colorScheme.primary,
                labelStyle: TextStyle(
                  color: tabviewController.index == index
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onPrimary.withOpacity(1),
                ),
                elevation: tabviewController.index == index ? 2 : 0,
                // Adjust the elevation to make it look like a selected chip
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabview(BuildContext context) {
    return _buildChipView(context);
  }

  String getTabLabel(int index) {
    switch (index) {
      case 0:
        return "Hotel";
      case 1:
        return "Apartment";
      case 2:
        return "Car";
      case 3:
        return "Flights";
      case 4:
        return "Islands";
      case 5:
        return "Other Service";
      default:
        return "";
    }
  }


}
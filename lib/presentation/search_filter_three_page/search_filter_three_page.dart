import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SearchFilterThreePage extends StatefulWidget {
  const SearchFilterThreePage({Key? key})
      : super(
          key: key,
        );

  @override
  SearchFilterThreePageState createState() => SearchFilterThreePageState();
}

class SearchFilterThreePageState extends State<SearchFilterThreePage>
    with AutomaticKeepAliveClientMixin<SearchFilterThreePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 148.v),
              child: Column(
                children: [
                  SizedBox(height: 29.v),
                  _buildFilteredThirty(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFilteredThirty(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Filtered (30)",
            style: theme.textTheme.titleMedium,
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgVuesaxLinearElement3,
            height: 20.adaptSize,
            width: 20.adaptSize,
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
}

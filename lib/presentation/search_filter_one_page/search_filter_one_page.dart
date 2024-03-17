import '../search_filter_one_page/widgets/frame2_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SearchFilterOnePage extends StatefulWidget {
  const SearchFilterOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  SearchFilterOnePageState createState() => SearchFilterOnePageState();
}

class SearchFilterOnePageState extends State<SearchFilterOnePage>
    with AutomaticKeepAliveClientMixin<SearchFilterOnePage> {
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
    return Align(
      alignment: Alignment.topRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 15.h),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  right: 26.h,
                ),
                child: Row(
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
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Text(
                      "Sort Result",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 16.v),
                  Wrap(
                    runSpacing: 6.v,
                    spacing: 6.h,
                    children:
                        List<Widget>.generate(3, (index) => Frame2ItemWidget()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

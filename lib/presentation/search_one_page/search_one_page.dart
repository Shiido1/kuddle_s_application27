import '../search_one_page/widgets/searchone_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SearchOnePage extends StatefulWidget {
  const SearchOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  SearchOnePageState createState() => SearchOnePageState();
}

class SearchOnePageState extends State<SearchOnePage>
    with AutomaticKeepAliveClientMixin<SearchOnePage> {
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
            child: Column(
              children: [
                SizedBox(height: 29.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  child: Column(
                    children: [
                      _buildFilteredThirty(context),
                      SizedBox(height: 30.v),
                      _buildSearchOne(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFilteredThirty(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
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

  /// Section Widget
  Widget _buildSearchOne(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 19.v,
        );
      },
      itemCount: 6,
      itemBuilder: (context, index) {
        return SearchoneItemWidget();
      },
    );
  }
}

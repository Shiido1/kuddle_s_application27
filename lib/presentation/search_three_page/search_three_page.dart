import '../../widgets/custom_search_view.dart';
import '../search_filter_bottomsheet/search_filter_bottomsheet.dart';
import '../search_three_page/widgets/searchthree_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SearchThreePage extends StatefulWidget {
  const SearchThreePage({Key? key})
      : super(
          key: key,
        );

  @override
  SearchThreePageState createState() => SearchThreePageState();
}

class SearchThreePageState extends State<SearchThreePage>
    with AutomaticKeepAliveClientMixin<SearchThreePage> {
  @override
  bool get wantKeepAlive => true;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: ListView(

            children: [
              SizedBox(height: 29.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: CustomSearchView(
                        controller: searchController,
                        hintText: "Search Your Place",
                        suffix: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true, // Set to true for a full-screen modal
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height - 300,
                                  // Adjust the height as needed
                                  child: SearchFilterBottomsheet(),
                                );
                              }, // Corrected this line
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 7.v, 11.h, 7.v),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgFilterlist,
                              height: 30.adaptSize,
                              width: 30.adaptSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.v),
                    _buildFilteredThirty(context),
                    SizedBox(height: 10.v),
                    _buildSearchThree(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
    /// Section Widget
  Widget _buildFilteredThirty(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 20.h),
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
  Widget _buildSearchThree(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 29.v - 20.v - 10.v, // Adjust the height as needed
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 19.v,
          );
        },
        itemCount: 40,
        itemBuilder: (context, index) {
          return SearchthreeItemWidget();
        },
      ),
    );
  }

}

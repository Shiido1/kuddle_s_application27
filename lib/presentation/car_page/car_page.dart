import '../car_page/widgets/car_item_widget.dart';
import '../car_page/widgets/frame_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_subtitle.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class CarPage extends StatelessWidget {
  CarPage({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

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
                  width: 287.h,
                  margin: EdgeInsets.only(left: 15.h),
                  child: Text(
                    "Need a Exceptional Ride?",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headlineLarge!.copyWith(
                      height: 1.40,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 26.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: CustomSearchView(
                  controller: searchController,
                  hintText: "Search Your Place",
                ),
              ),
              SizedBox(height: 25.v),
              _buildHotel(context),
              SizedBox(height: 40.v),
              _buildCarRental(context),
              SizedBox(height: 29.v),
              _buildCar(context),
            ],
          ),
        ),
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
          margin: EdgeInsets.fromLTRB(15.h, 14.v, 1.h, 17.v),
        ),
        AppbarTrailingCircleimage(
          imagePath: ImageConstant.imgEllipse3,
          margin: EdgeInsets.only(
            left: 11.h,
            top: 1.v,
            right: 16.h,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildHotel(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15.h),
      child: IntrinsicWidth(
        child: Wrap(
          runSpacing: 6.v,
          spacing: 6.h,
          children: List<Widget>.generate(5, (index) => FrameItemWidget()),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCarRental(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Car Rental",
            style: CustomTextStyles.titleLarge23,
          ),
          Padding(
            padding: EdgeInsets.only(top: 11.v),
            child: Text(
              "View All",
              style: CustomTextStyles.bodyMediumRegular_1,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCar(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 15.h),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 220.v,
            crossAxisCount: 3,
            mainAxisSpacing: 18.h,
            crossAxisSpacing: 18.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: 9,
          itemBuilder: (context, index) {
            return CarItemWidget();
          },
        ),
      ),
    );
  }
}

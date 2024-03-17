import '../favorite_one_screen/widgets/favoriteone_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_trailing_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';

class FavoriteOneScreen extends StatelessWidget {
 const FavoriteOneScreen({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: Padding(
              padding: EdgeInsets.only(left: 15.h, top: 24.v, right: 15.h),
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                   return SizedBox(height: 21.v);
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) {
                   return FavoriteoneItemWidget();
                  }))));
 }

 /// Section Widget
 PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgArrowLeftPrimary,
          margin: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 12.v),
          onTap: () {
           onTapArrowLeft(context);
          }),
      title: AppbarTitle(
          text: "View All Flight", margin: EdgeInsets.only(left: 14.h)),
      actions: [
       AppbarTrailingImage(
           imagePath: ImageConstant.imgVuesaxLinearElement3,
           margin: EdgeInsets.only(left: 15.h, top: 16.v, right: 15.h)),
       AppbarTrailingImage(
           imagePath: ImageConstant.imgVuesaxLinearFatrows,
           margin: EdgeInsets.only(left: 11.h, top: 16.v, right: 30.h))
      ]);
 }

 /// Navigates back to the previous screen.
 onTapArrowLeft(BuildContext context) {
  Navigator.pop(context);
 }
}

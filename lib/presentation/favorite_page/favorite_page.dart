import '../favorite_page/widgets/favorite_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_trailing_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';

class FavoritePage extends StatelessWidget {
 const FavoritePage({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: Padding(
              padding: EdgeInsets.only(left: 16.h, top: 24.v, right: 16.h),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 220.v,
                      crossAxisCount: 2,
                      mainAxisSpacing: 18.h,
                      crossAxisSpacing: 18.h),
                  physics: BouncingScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                   return FavoriteItemWidget();
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
      title:
      AppbarTitle(text: "Favorites", margin: EdgeInsets.only(left: 14.h)),
      actions: [
       AppbarTrailingImage(
           imagePath: ImageConstant.imgVuesaxLinearElement3Primary,
           margin: EdgeInsets.only(left: 15.h, top: 16.v, right: 15.h)),
       AppbarTrailingImage(
           imagePath: ImageConstant.imgVuesaxLinearFatrowsBlue700,
           margin: EdgeInsets.only(left: 11.h, top: 16.v, right: 30.h))
      ]);
 }

 /// Navigates back to the previous screen.
 onTapArrowLeft(BuildContext context) {
  Navigator.pop(context);
 }
}

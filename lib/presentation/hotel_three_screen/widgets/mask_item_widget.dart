import '../widgets/arrowleft_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';

// ignore: must_be_immutable
class MaskItemWidget extends StatelessWidget {
  const MaskItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 311.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgYuliyaPankevic311x430,
            height: 311.v,
            width: 430.h,
            radius: BorderRadius.circular(15.h),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter, // Adjusted alignment to bottom
            child: SizedBox(
              height: 68.v, // Set the height of the CustomAppBar
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // The image inside the CustomAppBar
                  CustomImageView(
                    imagePath: ImageConstant.imgYuliyaPankevic2,
                    height: 68.v, // Set the height to match the CustomAppBar
                    width: 430.h,
                    radius: BorderRadius.circular(15.h),
                    alignment: Alignment.center,
                  ),
                  CustomAppBar(
                    height: 68.v,
                    leadingWidth: 46.h,
                    leading: AppbarLeadingImage(
                      imagePath: ImageConstant.imgArrowLeft,
                      margin: EdgeInsets.only(left: 15.h),
                    ),
                    actions: [
                      AppbarTrailingIconbutton(
                        imagePath: ImageConstant.imgGroup135,
                        margin: EdgeInsets.symmetric(horizontal: 16.h),
                      ),
                    ],
                    // itemCount and itemBuilder removed as they are not used in CustomAppBar
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

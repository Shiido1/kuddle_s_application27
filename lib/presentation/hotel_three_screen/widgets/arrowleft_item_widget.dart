import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore: must_be_immutable
class ArrowleftItemWidget extends StatelessWidget {
  const ArrowleftItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: CustomImageView(
        imagePath: ImageConstant.imgArrowLeft,
        height: 31.adaptSize,
        width: 31.adaptSize,
        margin: EdgeInsets.only(left: 15.h),
      ),
    );
  }
}

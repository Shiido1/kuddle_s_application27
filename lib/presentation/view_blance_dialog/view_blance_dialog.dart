import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ViewBlanceDialog extends StatelessWidget {
  const ViewBlanceDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 400.h,
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 22.v,
      ),
      decoration: AppDecoration.fillOnPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgVuesaxLinearCloseSquare,
            height: 24.adaptSize,
            width: 24.adaptSize,
            alignment: Alignment.centerRight,
          ),
          SizedBox(height: 11.v),
          Text(
            "Your Total Amount",
            style: CustomTextStyles.bodyLarge_1,
          ),
          SizedBox(height: 7.v),
          Text(
            "5000.00",
            style: CustomTextStyles.displayMediumPrimary,
          ),
          SizedBox(height: 35.v),
        ],
      ),
    );
  }
}

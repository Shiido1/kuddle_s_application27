import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore: must_be_immutable
class OtherserviceItemWidget extends StatelessWidget {
  OtherserviceItemWidget({
    Key? key,
    this.onTapImgHour,
  }) : super(
          key: key,
        );

  VoidCallback? onTapImgHour;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 219.v,
      width: 181.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgValeriiaBugaio6,
            height: 219.v,
            width: 181.h,
            radius: BorderRadius.circular(
              20.h,
            ),
            alignment: Alignment.center,
            onTap: () {
              onTapImgHour!.call();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 17.v,
              ),
              decoration: AppDecoration.gradientBlackToBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 62.v),
                  Text(
                    "SPA - Body Massage",
                    style: CustomTextStyles.labelLargeOnPrimarySemiBold,
                  ),
                  SizedBox(height: 3.v),
                  Text(
                    "25/hour",
                    style: CustomTextStyles.labelLargeOnPrimary,
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

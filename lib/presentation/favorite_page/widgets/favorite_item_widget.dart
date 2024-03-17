import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore: must_be_immutable
class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 219.v,
      width: 190.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgValeriiaBugaio219x190,
            height: 219.v,
            width: 190.h,
            radius: BorderRadius.circular(
              20.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 87.v),
              padding: EdgeInsets.symmetric(
                horizontal: 14.h,
                vertical: 15.v,
              ),
              decoration: AppDecoration.gradientBlackToBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hotel Royal",
                          style: CustomTextStyles.labelLargeOnPrimarySemiBold,
                        ),
                        SizedBox(height: 4.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgVectorOnprimary,
                              height: 10.v,
                              width: 7.h,
                              margin: EdgeInsets.only(bottom: 2.v),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.h),
                              child: Text(
                                "Spain",
                                style: CustomTextStyles.bodySmallOnPrimary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.v),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: " 499/",
                                style: CustomTextStyles.labelLargeOnPrimary_1,
                              ),
                              TextSpan(
                                text: " night",
                                style: CustomTextStyles.bodySmallOnPrimaryLight,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    imagePath: ImageConstant.imgStarRate,
                    height: 13.adaptSize,
                    width: 13.adaptSize,
                    margin: EdgeInsets.only(top: 86.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 2.h,
                      top: 88.v,
                      bottom: 2.v,
                    ),
                    child: Text(
                      "4.9",
                      style: theme.textTheme.labelSmall,
                    ),
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

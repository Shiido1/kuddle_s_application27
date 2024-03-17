import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class FavoriteoneItemWidget extends StatelessWidget {
  const FavoriteoneItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.v),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder13,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgValeriiaBugaio169x139,
            height: 169.v,
            width: 139.h,
            radius: BorderRadius.circular(
              10.h,
            ),
          ),
          Container(
            height: 155.v,
            width: 229.h,
            margin: EdgeInsets.only(bottom: 13.v),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 34.v),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "IndiGO",
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 10.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgVuesaxLinearClock,
                              height: 14.adaptSize,
                              width: 14.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7.h),
                              child: Text(
                                "1hr 10min",
                                style: theme.textTheme.labelLarge,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 96.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomElevatedButton(
                              height: 22.v,
                              width: 36.h,
                              text: "Best",
                              buttonTextStyle: theme.textTheme.labelMedium!,
                            ),
                            CustomElevatedButton(
                              height: 22.v,
                              width: 50.h,
                              text: "Fastest",
                              buttonTextStyle: theme.textTheme.labelMedium!,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 85.v),
                      Text(
                        " 2946.00",
                        style: CustomTextStyles.labelLarge13,
                      ),
                      SizedBox(height: 3.v),
                      Text(
                        "Total",
                        style: CustomTextStyles.labelSmallPrimary,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgVuesaxLinearLocation,
                            height: 14.adaptSize,
                            width: 14.adaptSize,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 7.h),
                            child: Text(
                              "Direct ",
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 37.v),
                      Text(
                        "Includes: cabin bag ,Checked Bag",
                        style: CustomTextStyles.bodySmallBluegray400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

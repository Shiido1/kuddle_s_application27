import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class FavoritethreeItemWidget extends StatelessWidget {
  const FavoritethreeItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: theme.colorScheme.onPrimary.withOpacity(1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder13,
      ),
      child: Container(
        height: 224.v,
        width: 400.h,
        padding: EdgeInsets.symmetric(
          horizontal: 9.h,
          vertical: 5.v,
        ),
        decoration: AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder13,
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgValeriiaBugaio214x139,
                    height: 214.v,
                    width: 139.h,
                    radius: BorderRadius.circular(
                      10.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 13.h,
                      bottom: 8.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomElevatedButton(
                          height: 22.v,
                          width: 36.h,
                          text: "Best",
                          margin: EdgeInsets.only(left: 79.h),
                          buttonTextStyle: theme.textTheme.labelMedium!,
                        ),
                        SizedBox(height: 14.v),
                        Text(
                          "Hotel Royal",
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 10.v),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgVectorGray700,
                              height: 13.v,
                              width: 8.h,
                              margin: EdgeInsets.only(
                                top: 1.v,
                                bottom: 16.v,
                              ),
                            ),
                            Container(
                              width: 193.h,
                              margin: EdgeInsets.only(left: 5.h),
                              child: Text(
                                "3/2 Thanon Khao, Vachirapayabal, Dusit.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.v),
                        SizedBox(
                          width: 228.h,
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: " 499/",
                                      style: CustomTextStyles.labelLarge13_1,
                                    ),
                                    TextSpan(
                                      text: " night",
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Spacer(),
                              CustomImageView(
                                imagePath: ImageConstant.imgStarRate,
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                                margin: EdgeInsets.only(bottom: 2.v),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text(
                                  "4.9",
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.v),
                        Text(
                          "Includes taxes and charges",
                          style: CustomTextStyles.bodySmallBluegray4008,
                        ),
                        SizedBox(height: 13.v),
                        Text(
                          "Hotel Room : 2 beds",
                          style: theme.textTheme.labelLarge,
                        ),
                        SizedBox(height: 9.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath:
                                  ImageConstant.imgVuesaxLinearTickCircle,
                              height: 10.adaptSize,
                              width: 10.adaptSize,
                              margin: EdgeInsets.symmetric(vertical: 1.v),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7.h),
                              child: Text(
                                "Free Cancellation",
                                style: CustomTextStyles.labelMediumGreen80001,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath:
                                  ImageConstant.imgVuesaxLinearTickCircle,
                              height: 10.adaptSize,
                              width: 10.adaptSize,
                              margin: EdgeInsets.only(bottom: 2.v),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7.h),
                              child: Text(
                                "No Prepayment Needed",
                                style: CustomTextStyles.labelMediumGreen80001,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomElevatedButton(
              height: 22.v,
              width: 104.h,
              text: "Breakfast Included",
              buttonTextStyle: theme.textTheme.labelMedium!,
              alignment: Alignment.topRight,
            ),
          ],
        ),
      ),
    );
  }
}

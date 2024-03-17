import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore: must_be_immutable
class CarItemWidget extends StatelessWidget {
  const CarItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 219.v,
      width: 181.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgValeriiaBugaio2,
            height: 219.v,
            width: 181.h,
            radius: BorderRadius.circular(
              20.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Container(
                height: 219.v,
                width: 181.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 8.h,
                  vertical: 15.v,
                ),
                decoration: AppDecoration.gradientBlackToBlueGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(right: 3.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Citoen Elysee Petrol Manual",
                              style:
                                  CustomTextStyles.labelLargeOnPrimarySemiBold,
                            ),
                            SizedBox(height: 8.v),
                            Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgFilter,
                                  height: 15.v,
                                  width: 13.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.h),
                                  child: Text(
                                    "Petrol",
                                    style: CustomTextStyles.labelLargeOnPrimary,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 9.v),
                            Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgProfile,
                                  height: 15.v,
                                  width: 16.h,
                                  margin: EdgeInsets.only(bottom: 1.v),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.h),
                                  child: Text(
                                    "5 person",
                                    style: CustomTextStyles.labelLargeOnPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.v),
                        child: Text(
                          " 29 / Per day",
                          style: theme.textTheme.labelMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

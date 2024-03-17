import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore: must_be_immutable
class FlightsItemWidget extends StatelessWidget {
  const FlightsItemWidget({Key? key})
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
            child: SizedBox(
              height: 219.v,
              width: 181.h,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle26,
                    height: 219.v,
                    width: 181.h,
                    radius: BorderRadius.circular(
                      8.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 6.h,
                        bottom: 15.v,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Abuja ",
                                style: CustomTextStyles
                                    .labelLargeOnPrimarySemiBold,
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgBiArrowRight,
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                                margin: EdgeInsets.only(left: 10.h),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.h),
                                child: Text(
                                  "Dubia ",
                                  style: CustomTextStyles
                                      .labelLargeOnPrimarySemiBold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.v),
                          Text(
                            "Jul 6, 2023 - Jul 17 2023",
                            style: CustomTextStyles.labelLargeOnPrimary,
                          ),
                          SizedBox(height: 8.v),
                          CustomImageView(
                            imagePath: ImageConstant.imgProfileOnprimary,
                            height: 29.v,
                            width: 62.h,
                          ),
                        ],
                      ),
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

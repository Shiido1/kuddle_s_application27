import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore: must_be_immutable
class SearchoneItemWidget extends StatelessWidget {
  const SearchoneItemWidget({Key? key})
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgValeriiaBugaio3,
            height: 108.v,
            width: 116.h,
            radius: BorderRadius.circular(
              15.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 5.v,
              bottom: 18.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        bottom: 15.v,
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
                SizedBox(height: 7.v),
                SizedBox(
                  width: 246.h,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

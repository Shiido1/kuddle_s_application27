import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class LastbookcompleteItemWidget extends StatelessWidget {
  const LastbookcompleteItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 5.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder13,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 40.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgValeriiaBugaio108x116,
                  height: 108.v,
                  width: 116.h,
                  radius: BorderRadius.circular(
                    15.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 19.h,
                    top: 5.v,
                    bottom: 11.v,
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
                      SizedBox(height: 9.v),
                      CustomElevatedButton(
                        height: 22.v,
                        width: 72.h,
                        text: "Completed",
                        buttonStyle: CustomButtonStyles.fillGreenTL4,
                        buttonTextStyle: CustomTextStyles.bodySmallGreen8000110,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          Divider(),
          SizedBox(height: 10.v),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 6.h,
              vertical: 4.v,
            ),
            decoration: AppDecoration.fillGreen800011.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder4,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgTickSquare,
                  height: 10.adaptSize,
                  width: 10.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Text(
                    "You Canceled This Hotel Booking ",
                    style: CustomTextStyles.bodySmallGreen80001,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.v),
        ],
      ),
    );
  }
}

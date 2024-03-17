import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class FavoritefiveItemWidget extends StatelessWidget {
  const FavoritefiveItemWidget({Key? key})
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
            imagePath: ImageConstant.imgValeriiaBugaio211x139,
            height: 211.v,
            width: 139.h,
            radius: BorderRadius.circular(
              10.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 11.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                        margin: EdgeInsets.only(left: 10.h),
                        buttonTextStyle: theme.textTheme.labelMedium!,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.v),
                Text(
                  "SPA - Body Massage",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 6.v),
                SizedBox(
                  width: 213.h,
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodySmall11.copyWith(
                      height: 1.45,
                    ),
                  ),
                ),
                SizedBox(height: 9.v),
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
                SizedBox(height: 11.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    " 2946.00",
                    style: CustomTextStyles.labelLarge13,
                  ),
                ),
                SizedBox(height: 3.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Total",
                    style: CustomTextStyles.labelSmallPrimary,
                  ),
                ),
                SizedBox(height: 4.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgVuesaxLinearTickCircle,
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
                      imagePath: ImageConstant.imgVuesaxLinearTickCircle,
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
    );
  }
}

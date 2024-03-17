import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class SearchFilterBottomsheet extends StatefulWidget {
  const SearchFilterBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  State<SearchFilterBottomsheet> createState() => _SearchFilterBottomsheetState();
}

class _SearchFilterBottomsheetState extends State<SearchFilterBottomsheet> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14.h,
          vertical: 19.v,
        ),
        decoration: AppDecoration.fillOnPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder13,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 64.h,
              child: Divider(
                color: appTheme.gray400,
              ),
            ),
            SizedBox(height: 20.v),
            Text(
              "Filter",
              style: CustomTextStyles.titleLargeBold,
            ),
            SizedBox(height: 23.v),
            Divider(),
            SizedBox(height: 30.v),
            // SizedBox(height: 174.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "Price",
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),
            SizedBox(height: 17.v),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(left: 66.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 27.v,
                      width: 38.h,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 22.v,
                              width: 38.h,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(
                                  5.h,
                                ),
                              ),
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgPolygon3,
                            height: 9.adaptSize,
                            width: 9.adaptSize,
                            alignment: Alignment.bottomCenter,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 3.v),
                              child: Text(
                                "30",
                                style: CustomTextStyles
                                    .labelLargeOnPrimarySemiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomElevatedButton(
                          height: 22.v,
                          width: 46.h,
                          text: "300",
                          buttonStyle: CustomButtonStyles.fillPrimaryTL5,
                          buttonTextStyle:
                              CustomTextStyles.labelLargeOnPrimarySemiBold,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgPolygon3,
                          height: 9.adaptSize,
                          width: 9.adaptSize,
                          margin: EdgeInsets.only(left: 15.h),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 4.v),
            SliderTheme(
              data: SliderThemeData(
                trackShape: RoundedRectSliderTrackShape(),
                activeTrackColor: theme.colorScheme.primary,
                inactiveTrackColor: theme.colorScheme.primary.withOpacity(0.1),
                thumbColor: theme.colorScheme.onPrimary.withOpacity(1),
                thumbShape: RoundSliderThumbShape(),
              ),
              child: RangeSlider(
                values: RangeValues(
                  19.38,
                  91.38,
                ),
                min: 0.0,
                max: 100.0,
                onChanged: (value) {
setState(() {

});
                },
              ),
            ),
            SizedBox(height: 45.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "Start Rating",
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),
            SizedBox(height: 15.v),
            _buildFrame6(context),
            SizedBox(height: 114.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                    height: 49.v,
                    width: 119.h,
                    text: "Reset",
                    buttonStyle: CustomButtonStyles.fillBlueTL24,
                  ),
                  CustomElevatedButton(
                    height: 49.v,
                    width: 163.h,
                    text: "Apply Filter",
                    margin: EdgeInsets.only(left: 30.h),
                    buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                  ),
                ],
              ),
            ),
            // SizedBox(height: 50.v),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame6(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFrame1(
            context,
            userImage: ImageConstant.imgStarRateOnprimary,
            starRateLabel: "5",
          ),
          _buildFrame(
            context,
            rating: "4",
          ),
          _buildFrame(
            context,
            rating: "3",
          ),
          _buildFrame1(
            context,
            userImage: ImageConstant.imgStarRatePrimary,
            starRateLabel: "2",
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 18.h,
              vertical: 8.v,
            ),
            decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgStarRatePrimary,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 6.h,
                    top: 3.v,
                    bottom: 3.v,
                  ),
                  child: Text(
                    "1",
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String rating,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgStarRatePrimary,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 6.h,
              top: 3.v,
              bottom: 3.v,
            ),
            child: Text(
              rating,
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrame1(
    BuildContext context, {
    required String userImage,
    required String starRateLabel,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: userImage,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 6.h,
              top: 3.v,
              bottom: 3.v,
            ),
            child: Text(
              starRateLabel,
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

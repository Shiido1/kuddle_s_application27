import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashFourScreen extends StatelessWidget {
  const SplashFourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: SizedBox(
                        height: mediaQueryData.size.height,
                        width: double.maxFinite,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                  height: 506.v,
                                  width: double.maxFinite,
                                  child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgRectangle1,
                                            height: 496.v,
                                            width: 430.h,
                                            alignment: Alignment.center),
                                        _buildSplashContent(context)
                                      ]))),
                          CustomImageView(
                              imagePath: ImageConstant.imgMaskGroup3,
                              height: 434.v,
                              width: 430.h,
                              alignment: Alignment.topCenter),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  width: 164.h,
                                  margin:
                                      EdgeInsets.only(left: 13.h, top: 248.v),
                                  child: Text(
                                      "Let's \ndiscover the world with us",
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles.displayMedium42
                                          .copyWith(height: 1.39))))
                        ]))))));
  }

  /// Section Widget
  Widget _buildSplashContent(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 14.h, bottom: 50.v),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 376.h,
                      child: Text(
                          "Your journey begins with Maczuby. Where will it take you today?",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumGray700
                              .copyWith(height: 1.64))),
                  SizedBox(height: 47.v),
                  Container(
                      margin: EdgeInsets.only(left: 160.h, right: 134.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.h, vertical: 8.v),
                      decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder7),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.v),
                            SizedBox(
                              height: 6.v,
                              child: AnimatedSmoothIndicator(
                                activeIndex: 2,
                                count: 3,
                                effect: ScrollingDotsEffect(
                                    spacing: 5,
                                    activeDotColor: theme.colorScheme.primary,
                                    dotColor: theme.colorScheme.primary
                                        .withOpacity(0.42),
                                    dotHeight: 6.v,
                                    dotWidth: 6.h),
                              ),
                            )
                          ])),
                  SizedBox(height: 59.v),
                  CustomElevatedButton(
                      buttonStyle: CustomButtonStyles.outlinePrimary,
                      text: "Next",
                      margin: EdgeInsets.only(left: 42.h, right: 14.h),
                      onPressed: () {
                        onTapNext(context);
                      }),
                  SizedBox(height: 19.v),
                  CustomElevatedButton(
                      text: "Skip",
                      margin: EdgeInsets.only(left: 42.h, right: 14.h),
                      buttonStyle: CustomButtonStyles.fillErrorContainer,
                      onPressed: () {
                        onTapSkip(context);
                      })
                ])));
  }

  /// Navigates to the splashFourScreen when the action is triggered.
  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginPageScreen);
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapSkip(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginPageScreen);
  }
}

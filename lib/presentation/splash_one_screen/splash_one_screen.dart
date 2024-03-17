import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

class SplashOneScreen extends StatelessWidget {
  const SplashOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 80.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 9.v),
              Padding(
                padding: EdgeInsets.only(left: 21.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Mac",
                            style: CustomTextStyles.displayMediumOnPrimary50,
                          ),
                          TextSpan(
                            text: "Zuby",
                            style:
                                CustomTextStyles.displayMediumPrimaryContainer,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      margin: EdgeInsets.only(
                        left: 5.h,
                        bottom: 44.v,
                      ),
                      padding: EdgeInsets.all(3.h),
                      decoration: AppDecoration.fillOnPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder7,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgClose,
                        height: 8.v,
                        width: 6.h,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

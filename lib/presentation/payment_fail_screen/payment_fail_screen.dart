import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

class PaymentFailScreen extends StatelessWidget {
  const PaymentFailScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 142.adaptSize,
                width: 142.adaptSize,
                padding: EdgeInsets.symmetric(
                  horizontal: 43.h,
                  vertical: 42.v,
                ),
                decoration: AppDecoration.fillRed.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder71,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgFlagOnprimary,
                  height: 52.adaptSize,
                  width: 52.adaptSize,
                  alignment: Alignment.bottomLeft,
                ),
              ),
              SizedBox(height: 32.v),
              Text(
                "Payment failed",
                style: CustomTextStyles.headlineMediumMedium,
              ),
              SizedBox(height: 9.v),
              Text(
                "Not enough money on the card",
                style: CustomTextStyles.bodyLargeErrorContainer,
              ),
              SizedBox(height: 77.v),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 23.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowLeftPrimary16x16,
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                        margin: EdgeInsets.only(bottom: 2.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(
                          "Pay with another card",
                          style: CustomTextStyles.titleSmall15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 7.v),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

class MenuLinkScreen extends StatelessWidget {
  const MenuLinkScreen({Key? key})
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
          width: 752.h,
          padding: EdgeInsets.only(
            left: 102.h,
            top: 68.v,
            right: 102.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.v),
              Padding(
                padding: EdgeInsets.only(right: 361.h),
                child: DottedBorder(
                  color: appTheme.deepPurpleA200,
                  padding: EdgeInsets.only(
                    left: 1.h,
                    top: 1.v,
                    right: 1.h,
                    bottom: 1.v,
                  ),
                  strokeWidth: 1.h,
                  radius: Radius.circular(5),
                  borderType: BorderType.RRect,
                  dashPattern: [
                    10,
                    5,
                  ],
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 19.h,
                      vertical: 18.v,
                    ),
                    decoration: AppDecoration.outlineDeepPurpleA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder7,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Accommodations",
                          style: CustomTextStyles.titleMediumPoppinsOnPrimary,
                        ),
                        SizedBox(height: 25.v),
                        Text(
                          "Accommodations",
                          style: CustomTextStyles.bodyLargePoppinsOnPrimary,
                        ),
                        SizedBox(height: 24.v),
                        Text(
                          "Accommodations",
                          style: CustomTextStyles.titleMediumPoppinsOnPrimary,
                        ),
                        SizedBox(height: 5.v),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

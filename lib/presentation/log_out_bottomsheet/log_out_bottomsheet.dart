import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/main_core/session_manager.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';

class LogOutBottomsheet extends StatelessWidget {
  const LogOutBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return _buildScrollView(context);
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 22.v),
            decoration: AppDecoration.fillOnPrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder13),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(width: 64.h, child: Divider(color: appTheme.gray400)),
              SizedBox(height: 26.v),
              Text("Log Out", style: CustomTextStyles.headlineMediumRedA400),
              SizedBox(height: 31.v),
              Divider(),
              SizedBox(height: 32.v),
              Text("Are you sure you want to log out?",
                  style: CustomTextStyles.titleMediumMedium),
              SizedBox(height: 39.v),
              CustomElevatedButton(
                  height: 45.v,
                  text: "Yes, Log out",
                  margin: EdgeInsets.symmetric(horizontal: 52.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                  onPressed: () {
                    onTapYesLogOut(context);
                  }),
              SizedBox(height: 22.v),
              CustomElevatedButton(
                  height: 45.v,
                  text: "Cancel",
                  margin: EdgeInsets.symmetric(horizontal: 53.h),
                  buttonStyle: CustomButtonStyles.fillBlueTL24,
                  onPressed: () {
                    onTapCancle(context);
                  }),
              SizedBox(height: 23.v)
            ])));
  }

  /// Navigates to the bookRoomDetailsScreen when the action is triggered.
  onTapYesLogOut(BuildContext context) {
   SessionManager.instance.logOut();
    Navigator.pushNamed(context, AppRoutes.signInScreen);
  }

  /// Navigates to the bookRoomDetailsScreen when the action is triggered.
  onTapCancle(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.bookRoomDetailsScreen);
  }
}

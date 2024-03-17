import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:kuddle_s_application27/widgets/custom_outlined_button.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 40.v),
                  child: Column(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgArrowLeft,
                        height: 31.adaptSize,
                        width: 31.adaptSize,
                        alignment: Alignment.centerLeft,
                        onTap: () {
                          onTapImgArrowLeft(context);
                        }),
                    SizedBox(height: 65.v),
                    Text("Let’s log you in",
                        style: theme.textTheme.displayMedium),
                    // SizedBox(height: 73.v),
                    // _buildContinueWithFacebookButton(context),
                    // SizedBox(height: 25.v),
                    // _buildContinueWithGoogleButton(context),
                    // SizedBox(height: 25.v),
                    // _buildContinueWithAppleButton(context),
                    // SizedBox(height: 65.v),
                    // Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 36.h),
                    //     child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.end,
                    //         children: [
                    //          Padding(
                    //              padding:
                    //              EdgeInsets.only(top: 10.v, bottom: 9.v),
                    //              child:
                    //              SizedBox(width: 149.h, child: Divider())),
                    //          Padding(
                    //              padding: EdgeInsets.only(left: 6.h),
                    //              child: Text("or",
                    //                  style:
                    //                  CustomTextStyles.titleMediumBlack900)),
                    //          Padding(
                    //              padding:
                    //              EdgeInsets.only(top: 10.v, bottom: 8.v),
                    //              child: SizedBox(
                    //                  width: 155.h, child: Divider(indent: 5.h)))
                    //         ])),
                    SizedBox(height: 72.v),
                    _buildSignInWithEmailButton(context),
                    SizedBox(height: 46.v),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 1.v),
                          child: Text("Don’t have an account?",
                              style: theme.textTheme.bodyMedium)),
                      GestureDetector(
                          onTap: () {
                            onTapTxtSignUp(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: Text("Sign up",
                                  style: theme.textTheme.titleSmall)))
                    ]),
                    SizedBox(height: 5.v)
                  ])),
            )));
  }

  /// Section Widget
  Widget _buildContinueWithFacebookButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "Continue with Facebook",
        margin: EdgeInsets.only(left: 37.h, right: 36.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 13.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgFacebook,
                height: 31.adaptSize,
                width: 31.adaptSize)));
  }

  /// Section Widget
  Widget _buildContinueWithGoogleButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "Continue with google",
        margin: EdgeInsets.only(left: 37.h, right: 36.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 13.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgGoogle,
                height: 26.adaptSize,
                width: 26.adaptSize)));
  }

  /// Section Widget
  Widget _buildContinueWithAppleButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "Continue with Apple",
        margin: EdgeInsets.only(left: 37.h, right: 36.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 13.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 26.v,
                width: 22.h)));
  }

  /// Section Widget
  Widget _buildSignInWithEmailButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => SignInScreen()));
      },
      height: 53.v,
      text: "Sign in with Email",
      margin: EdgeInsets.symmetric(horizontal: 36.h),
      buttonStyle: CustomButtonStyles.outlinePrimary,
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapTxtSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }
}

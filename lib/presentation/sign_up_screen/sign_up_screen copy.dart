import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/custom_checkbox_button.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  bool rememberMeCheckbox = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
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
                      SizedBox(height: 37.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                              width: 233.h,
                              child: Text("Create Your \nAccount",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.displayMedium!
                                      .copyWith(height: 1.39)))),
                      SizedBox(height: 55.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 36.h),
                          child: CustomTextFormField(
                              controller: emailController,
                              hintText: "Email",
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 17.h, vertical: 20.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgEmail1,
                                      height: 12.v,
                                      width: 18.h)),
                              prefixConstraints:
                                  BoxConstraints(maxHeight: 53.v))),
                      SizedBox(height: 24.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36.h),
                        child: CustomTextFormField(
                          controller: firstNameController,
                          hintText: "First Name",
                          textInputType: TextInputType.text,
                          prefix: Icon(Icons.account_circle_sharp),
                        ),
                      ),
                      SizedBox(height: 24.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36.h),
                        child: CustomTextFormField(
                            controller: lastNameController,
                            hintText: "Last Name",
                            textInputType: TextInputType.text,
                            prefix: Icon(Icons.account_circle)),
                      ),
                      SizedBox(height: 24.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36.h),
                        child: CustomTextFormField(
                            controller: usernameController,
                            hintText: "Username",
                            textInputType: TextInputType.text,
                            prefix: Icon(Icons.person_2)),
                      ),
                      SizedBox(height: 24.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36.h),
                        child: CustomTextFormField(
                          controller: phoneNumberController,
                          hintText: "Phone Number",
                          textInputType: TextInputType.phone,
                          prefix: Icon(Icons.phone_iphone_sharp),
                        ),
                      ),
                      SizedBox(height: 24.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 36.h),
                          child: CustomTextFormField(
                              controller: passwordController,
                              hintText: "Password",
                              textInputAction: TextInputAction.done,
                              contentPadding: EdgeInsets.all(15),
                              textInputType: TextInputType.visiblePassword,
                              obscureText: true)),
                      SizedBox(height: 18.v),
                      _buildRememberMeCheckbox(context),
                      SizedBox(height: 45.v),
                      CustomElevatedButton(
                          height: 53.v,
                          text: "Sign up",
                          margin: EdgeInsets.symmetric(horizontal: 36.h),
                          buttonStyle: CustomButtonStyles.outlinePrimary,
                          buttonTextStyle:
                              CustomTextStyles.titleMediumUrbanist),
                      SizedBox(height: 53.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 31.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 12.v, bottom: 7.v),
                                    child: SizedBox(
                                        width: 98.h, child: Divider())),
                                Padding(
                                    padding: EdgeInsets.only(left: 5.h),
                                    child: Text("or continue with",
                                        style: CustomTextStyles
                                            .titleMediumBlack900Medium)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 12.v, bottom: 7.v),
                                    child: SizedBox(
                                        width: 103.h,
                                        child: Divider(indent: 5.h)))
                              ])),
                      SizedBox(height: 35.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 46.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 55.v,
                                    width: 81.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 19.h, vertical: 6.v),
                                    decoration: AppDecoration.outlineBlack
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder13),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgFacebook,
                                        height: 41.adaptSize,
                                        width: 41.adaptSize,
                                        alignment: Alignment.center)),
                                Spacer(flex: 49),
                                Container(
                                    height: 55.v,
                                    width: 81.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 23.h, vertical: 10.v),
                                    decoration: AppDecoration.outlineBlack
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder13),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgGoogle,
                                        height: 32.adaptSize,
                                        width: 32.adaptSize,
                                        alignment: Alignment.topCenter)),
                                Spacer(flex: 50),
                                Container(
                                    height: 55.v,
                                    width: 81.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 27.h, vertical: 10.v),
                                    decoration: AppDecoration.outlineBlack
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder13),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgVector,
                                        height: 28.v,
                                        width: 24.h,
                                        alignment: Alignment.topCenter))
                              ])),
                      SizedBox(height: 51.v),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have account?",
                                style: theme.textTheme.bodyMedium),
                            GestureDetector(
                                onTap: () {
                                  onTapTxtLogIn(context);
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(left: 5.h),
                                    child: Text("Log in",
                                        style: theme.textTheme.titleSmall)))
                          ]),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  // Widget _buildRememberMeCheckbox(BuildContext context) {
  //   return Align(
  //       alignment: Alignment.centerLeft,
  //       child: Padding(
  //           padding: EdgeInsets.only(left: 36.h),
  //           child: CustomCheckboxButton(
  //               alignment: Alignment.centerLeft,
  //               text: "Remember me",
  //               value: rememberMeCheckbox,
  //               onChange: (value) {
  //                 rememberMeCheckbox = value;
  //               })));
  // }
  Widget _buildRememberMeCheckbox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Toggle the value when the checkbox is tapped
          rememberMeCheckbox = !rememberMeCheckbox;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: 36.h),
        child: Row(
          children: [
            Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4.0),
                color: rememberMeCheckbox ? Colors.black : Colors.white,
              ),
              child: rememberMeCheckbox
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16.0,
                    )
                  : null,
            ),
            SizedBox(width: 10.0),
            Text(
              "Remember me",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the signInScreen when the action is triggered.
  onTapTxtLogIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInScreen);
  }
}

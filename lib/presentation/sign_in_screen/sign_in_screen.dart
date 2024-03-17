import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/custom_checkbox_button.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../apiservices/validator.dart';
import '../../services/provider/provider_services.dart';

// ignore_for_file: must_be_immutable
class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool rememberMeCheckbox = false;
  bool _obscureText = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);

    // _passwordVisible = false;

    // deviceInfo = DeviceInfoPlugin();
    // // try and print deviceInfo to see all required stuffs then get the device name and pass it to the registration function
    // _getId();
    super.initState();
  }

  void signin(context) async {
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text('working here too')));

    if (_formKey.currentState!.validate()) {
      setState(() {});
      passwordFocusNode.unfocus();
      providerServices?.signIn(map: {
        // "type": "1",
        // "device_id": device!,
        // "device_type": Platform.isIOS ? "iPhone" : "android",
        // "device_name": deviceInfo.toString(),
        // "device_token": "$deviceToken",

        "emailAddress": emailController.text.trim(),
        "password": passwordController.text.trim(),
      }, context: context);
    }
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                      SizedBox(height: 36.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                              width: 257.h,
                              child: Text("Login to your \nAccount",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.displayMedium!
                                      .copyWith(height: 1.39)))),
                      SizedBox(height: 57.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 36.h),
                          child: CustomTextFormField(
                              textStyle: CustomTextStyles.bodyMediumBlack900,
                              focusNode: emailFocusNode,
                              validator: Validators.validateEmail(),
                              controller: emailController,
                              hintText: "Email",
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      17.h, 19.v, 17.h, 21.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgEmail1,
                                      height: 12.v,
                                      width: 18.h)),
                              prefixConstraints:
                                  BoxConstraints(maxHeight: 53.v))),
                      SizedBox(height: 23.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36.h),
                        child: CustomTextFormField(
                            textStyle: CustomTextStyles.bodyMediumBlack900,
                            focusNode: passwordFocusNode,
                            validator: Validators.validatePlainPassword(),
                            controller: passwordController,
                            hintText: "Password",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            prefix: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            obscureText: _obscureText),
                      ),
                      SizedBox(height: 12.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(right: 36.h),
                              child: Text("Forgot the password?",
                                  style: theme.textTheme.labelLarge))),
                      SizedBox(height: 10.v),
                      _buildRememberMeCheckbox(context),
                      SizedBox(height: 63.v),
                      GestureDetector(
                        onTap: () => signin(context),
                        child: Consumer<ProviderServices>(
                          builder: (_, value, __) => Center(
                            child: value.isLoading == true
                                ? const SpinKitCircle(
                                    color: Colors.yellow,
                                  )
                                : CustomElevatedButton(
                                    onPressed: () {
                                      signin(context);
                                    },
                                    height: 53.v,
                                    text: "Sign In",
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 36.h),
                                    buttonStyle:
                                        CustomButtonStyles.outlinePrimary,
                                  ),
                          ),
                        ),
                      ),
                      // SizedBox(height: 44.v),
                      // Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 31.h),
                      //     child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.end,
                      //         children: [
                      //           Padding(
                      //               padding:
                      //                   EdgeInsets.only(top: 12.v, bottom: 7.v),
                      //               child: SizedBox(
                      //                   width: 98.h, child: Divider())),
                      //           Padding(
                      //               padding: EdgeInsets.only(left: 5.h),
                      //               child: Text("or continue with",
                      //                   style: CustomTextStyles
                      //                       .titleMediumBlack900Medium)),
                      //           Padding(
                      //               padding:
                      //                   EdgeInsets.only(top: 12.v, bottom: 7.v),
                      //               child: SizedBox(
                      //                   width: 103.h,
                      //                   child: Divider(indent: 5.h)))
                      //         ])),
                      // SizedBox(height: 35.v),
                      // Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 46.h),
                      //     child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Container(
                      //               height: 55.v,
                      //               width: 81.h,
                      //               padding: EdgeInsets.symmetric(
                      //                   horizontal: 19.h, vertical: 6.v),
                      //               decoration: AppDecoration.outlineBlack
                      //                   .copyWith(
                      //                       borderRadius: BorderRadiusStyle
                      //                           .roundedBorder13),
                      //               child: CustomImageView(
                      //                   imagePath: ImageConstant.imgFacebook,
                      //                   height: 41.adaptSize,
                      //                   width: 41.adaptSize,
                      //                   alignment: Alignment.center)),
                      //           Spacer(flex: 49),
                      //           Container(
                      //               height: 55.v,
                      //               width: 81.h,
                      //               padding: EdgeInsets.symmetric(
                      //                   horizontal: 23.h, vertical: 10.v),
                      //               decoration: AppDecoration.outlineBlack
                      //                   .copyWith(
                      //                       borderRadius: BorderRadiusStyle
                      //                           .roundedBorder13),
                      //               child: CustomImageView(
                      //                   imagePath: ImageConstant.imgGoogle,
                      //                   height: 32.adaptSize,
                      //                   width: 32.adaptSize,
                      //                   alignment: Alignment.topCenter)),
                      //           Spacer(flex: 50),
                      //           Container(
                      //               height: 55.v,
                      //               width: 81.h,
                      //               padding: EdgeInsets.symmetric(
                      //                   horizontal: 27.h, vertical: 10.v),
                      //               decoration: AppDecoration.outlineBlack
                      //                   .copyWith(
                      //                       borderRadius: BorderRadiusStyle
                      //                           .roundedBorder13),
                      //               child: CustomImageView(
                      //                   imagePath: ImageConstant.imgVector,
                      //                   height: 28.v,
                      //                   width: 24.h,
                      //                   alignment: Alignment.topCenter))
                      //         ])),
                      SizedBox(height: 51.v),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                    ])))));
  }

  Widget _buildRememberMeCheckbox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          rememberMeCheckbox = !rememberMeCheckbox;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Row(
          children: [
            Container(
              width: 20.0,
              height: 20.0,
              margin: EdgeInsets.only(left: 17),
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

  /// Navigates to the signUpScreen when the action is triggered.
  onTapTxtSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }
}

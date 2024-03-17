import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_trailing_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';

class PaymentOptionOneScreen extends StatelessWidget {
 const PaymentOptionOneScreen({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 24.v),
              child: Column(children: [
               _buildPaymentMethod(context),
               SizedBox(height: 35.v),
               _buildPaypalOne(context),
               SizedBox(height: 22.v),
               _buildGoogle(context),
               SizedBox(height: 22.v),
               _buildVector(context),
               SizedBox(height: 29.v),
               Align(
                   alignment: Alignment.centerRight,
                   child: GestureDetector(
                       onTap: () {
                        onTapTxtAddNewCard(context);
                       },
                       child: Padding(
                           padding: EdgeInsets.only(right: 1.h),
                           child: Text("Add New Card ",
                               style: CustomTextStyles.labelLargeBlue700)))),
               SizedBox(height: 91.v),
               CustomElevatedButton(
                   width: 267.h,
                   text: "Pay Now",
                   buttonStyle: CustomButtonStyles.fillPrimary,
                   onPressed: () {
                    onTapPayNow(context);
                   }),
               SizedBox(height: 5.v)
              ]))));
 }

 /// Section Widget
 PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgArrowLeftPrimary,
          margin: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 12.v),
          onTap: () {
           onTapArrowLeft(context);
          }),
      title:
      AppbarTitle(text: "Payment", margin: EdgeInsets.only(left: 14.h)),
      actions: [
       AppbarTrailingImage(
           imagePath: ImageConstant.imgQrCodeScanner,
           margin: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 15.v))
      ]);
 }

 /// Section Widget
 Widget _buildPaymentMethod(BuildContext context) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child:
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
       Text("Payment Method", style: CustomTextStyles.titleSmall15_1),
       GestureDetector(
           onTap: () {
            onTapTxtViewBalance(context);
           },
           child: Padding(
               padding: EdgeInsets.only(bottom: 2.v),
               child: Text("view balance",
                   style: CustomTextStyles.labelLargeBlue700)))
      ]));
 }

 /// Section Widget
 Widget _buildPaypalOne(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(right: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 13.v),
      decoration: AppDecoration.outlineGray
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
       CustomImageView(
           imagePath: ImageConstant.imgPaypal1,
           height: 30.adaptSize,
           width: 30.adaptSize,
           margin: EdgeInsets.only(top: 1.v)),
       Padding(
           padding: EdgeInsets.only(left: 20.h, top: 7.v, bottom: 4.v),
           child: Text("Paypal", style: CustomTextStyles.titleSmallBold15)),
       Spacer(),
       Container(
           margin: EdgeInsets.symmetric(vertical: 8.v),
           padding: EdgeInsets.all(1.h),
           decoration: AppDecoration.outlinePrimary1
               .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
           child: Container(
               height: 10.adaptSize,
               width: 10.adaptSize,
               decoration: BoxDecoration(
                   color: theme.colorScheme.primary,
                   borderRadius: BorderRadius.circular(5.h))))
      ]));
 }

 /// Section Widget
 Widget _buildGoogle(BuildContext context) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 13.v),
      decoration: AppDecoration.outlineGray
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
       CustomImageView(
           imagePath: ImageConstant.imgGoogle,
           height: 30.adaptSize,
           width: 30.adaptSize,
           margin: EdgeInsets.only(top: 1.v)),
       Padding(
           padding: EdgeInsets.only(left: 20.h, top: 7.v, bottom: 4.v),
           child:
           Text("Google Pay", style: CustomTextStyles.titleSmallBold15)),
       Spacer(),
       CustomImageView(
           imagePath: ImageConstant.imgGroup215,
           height: 14.adaptSize,
           width: 14.adaptSize,
           margin: EdgeInsets.only(top: 9.v, right: 1.h, bottom: 8.v))
      ]));
 }

 /// Section Widget
 Widget _buildVector(BuildContext context) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 13.v),
      decoration: AppDecoration.outlineGray
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
       CustomImageView(
           imagePath: ImageConstant.imgVector,
           height: 30.v,
           width: 25.h,
           margin: EdgeInsets.only(top: 1.v)),
       Padding(
           padding: EdgeInsets.only(left: 19.h, top: 7.v, bottom: 4.v),
           child:
           Text("Apple Pay", style: CustomTextStyles.titleSmallBold15)),
       Spacer(),
       CustomImageView(
           imagePath: ImageConstant.imgGroup215,
           height: 14.adaptSize,
           width: 14.adaptSize,
           margin: EdgeInsets.only(top: 9.v, bottom: 8.v))
      ]));
 }

 /// Navigates back to the previous screen.
 onTapArrowLeft(BuildContext context) {
  Navigator.pop(context);
 }

 /// Navigates to the addPaymentCardScreen when the action is triggered.
 onTapTxtViewBalance(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.addPaymentCardScreen);
 }

 /// Navigates to the addPaymentCardScreen when the action is triggered.
 onTapTxtAddNewCard(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.addPaymentCardScreen);
 }

 /// Navigates to the bookRoomDetailsScreen when the action is triggered.
 onTapPayNow(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.bookRoomDetailsScreen);
 }
}

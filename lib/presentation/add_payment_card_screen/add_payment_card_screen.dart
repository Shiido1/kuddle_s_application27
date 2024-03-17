import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

// ignore_for_file: must_be_immutable
class AddPaymentCardScreen extends StatelessWidget {
 AddPaymentCardScreen({Key? key}) : super(key: key);

 TextEditingController nameController = TextEditingController();

 TextEditingController cardNumberController = TextEditingController();

 TextEditingController expirydateController = TextEditingController();

 TextEditingController cvvController = TextEditingController();

 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _buildAppBar(context),
          body: Form(
              key: _formKey,
              child: Container(
                  width: double.maxFinite,
                  padding:
                  EdgeInsets.symmetric(horizontal: 15.h, vertical: 19.v),
                  child: Column(children: [
                   _buildCartGeometric(context),
                   SizedBox(height: 57.v),
                   _buildName(context),
                   SizedBox(height: 20.v),
                   _buildCardNumber(context),
                   SizedBox(height: 20.v),
                   _buildExpirydate1(context),
                   SizedBox(height: 77.v),
                   _buildAddCard(context),
                   SizedBox(height: 5.v)
                  ])))));
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
      AppbarTitle(text: "New Card", margin: EdgeInsets.only(left: 10.h)));
 }

 /// Section Widget
 Widget _buildCartGeometric(BuildContext context) {
  return OutlineGradientButton(
      padding: EdgeInsets.only(left: 2.h, top: 2.v, right: 2.h, bottom: 2.v),
      strokeWidth: 2.h,
      gradient: LinearGradient(
          begin: Alignment(0, 0.43),
          end: Alignment(1, 0.5),
          colors: [theme.colorScheme.onPrimary, appTheme.gray505e]),
      corners: Corners(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)),
      child: Container(
          decoration: AppDecoration.outline
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 18.v),
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                  image: DecorationImage(
                      image: AssetImage(ImageConstant.imgMask),
                      fit: BoxFit.cover)),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   SizedBox(height: 3.v),
                   Padding(
                       padding: EdgeInsets.only(left: 2.h, right: 7.h),
                       child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            Opacity(
                                opacity: 0.7,
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgChip,
                                    height: 26.v,
                                    width: 35.h,
                                    margin: EdgeInsets.only(top: 5.v))),
                            CustomImageView(
                                imagePath: ImageConstant.imgLogo,
                                height: 27.v,
                                width: 22.h,
                                margin: EdgeInsets.only(bottom: 4.v))
                           ])),
                   SizedBox(height: 89.v),
                   Align(
                       alignment: Alignment.centerLeft,
                       child: Text("3455 4562 7710 3507",
                           style: CustomTextStyles.titleLargeOnPrimary)),
                   SizedBox(height: 14.v),
                   Divider(
                       color: appTheme.gray50.withOpacity(0.21),
                       indent: 2.h,
                       endIndent: 5.h),
                   SizedBox(height: 7.v),
                   Container(
                       margin: EdgeInsets.only(left: 2.h, right: 5.h),
                       decoration: BoxDecoration(
                           borderRadius: BorderRadiusStyle.roundedBorder7),
                       child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                            Container(
                                decoration: AppDecoration.outlineGrayF,
                                child: Text("John Carter",
                                    style: CustomTextStyles
                                        .titleSmallOnPrimary_1)),
                            Container(
                                decoration: AppDecoration.outlineGrayF,
                                child: Text("02/30",
                                    style: CustomTextStyles
                                        .titleSmallOnPrimary_1))
                           ]))
                  ]))));
 }

 /// Section Widget
 Widget _buildName(BuildContext context) {
  return CustomTextFormField(
      controller: nameController,
      hintText: "Card Holder Name",
      hintStyle: CustomTextStyles.bodyMediumRegular,
      contentPadding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 15.v),
      borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8,
      fillColor: theme.colorScheme.primary.withOpacity(0.1));
 }

 /// Section Widget
 Widget _buildCardNumber(BuildContext context) {
  return CustomTextFormField(
      controller: cardNumberController,
      hintText: "Card Number",
      hintStyle: CustomTextStyles.bodyMediumRegular,
      textInputType: TextInputType.number,
      contentPadding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 15.v),
      borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8,
      fillColor: theme.colorScheme.primary.withOpacity(0.1));
 }

 /// Section Widget
 Widget _buildExpirydate(BuildContext context) {
  return Expanded(
      child: Padding(
          padding: EdgeInsets.only(right: 12.h),
          child: CustomTextFormField(
              controller: expirydateController,
              hintText: "Expiry date",
              hintStyle: CustomTextStyles.bodyMediumRegular,
              contentPadding:
              EdgeInsets.symmetric(horizontal: 19.h, vertical: 15.v),
              borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8,
              fillColor: theme.colorScheme.primary.withOpacity(0.1))));
 }

 /// Section Widget
 Widget _buildCvv(BuildContext context) {
  return Expanded(
      child: Padding(
          padding: EdgeInsets.only(left: 12.h),
          child: CustomTextFormField(
              controller: cvvController,
              hintText: "CVV Number",
              hintStyle: CustomTextStyles.bodyMediumRegular,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.number,
              contentPadding:
              EdgeInsets.symmetric(horizontal: 19.h, vertical: 15.v),
              borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8,
              fillColor: theme.colorScheme.primary.withOpacity(0.1))));
 }

 /// Section Widget
 Widget _buildExpirydate1(BuildContext context) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_buildExpirydate(context), _buildCvv(context)]);
 }

 /// Section Widget
 Widget _buildAddCard(BuildContext context) {
  return CustomElevatedButton(
      width: 273.h,
      text: "Add Card",
      buttonStyle: CustomButtonStyles.fillPrimary,
      onPressed: () {
       onTapAddCard(context);
      });
 }

 /// Navigates back to the previous screen.
 onTapArrowLeft(BuildContext context) {
  Navigator.pop(context);
 }

 /// Navigates to the paymentOptionScreen when the action is triggered.
 onTapAddCard(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.paymentOptionScreen);
 }
}

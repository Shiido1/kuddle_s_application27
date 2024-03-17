import 'package:flutter/material.dart';import 'package:kuddle_s_application27/core/app_export.dart';import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable
class BookRoomDetailsScreen extends StatelessWidget {BookRoomDetailsScreen({Key? key}) : super(key: key);

TextEditingController firstNameController = TextEditingController();

TextEditingController lastNameController = TextEditingController();

TextEditingController emailController = TextEditingController();

TextEditingController callController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: Form(key: _formKey, child: Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 26.v), child: Column(children: [_buildFirstName1(context), SizedBox(height: 25.v), _buildEmail(context), SizedBox(height: 25.v), _buildCall(context), SizedBox(height: 57.v), _buildContinues(context), SizedBox(height: 5.v)]))))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(leadingWidth: 46.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgArrowLeftPrimary, margin: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 12.v), onTap: () {onTapArrowLeft(context);}), title: AppbarTitle(text: "Name of Reservation", margin: EdgeInsets.only(left: 10.h))); } 
/// Section Widget
Widget _buildFirstName(BuildContext context) { return Expanded(child: Padding(padding: EdgeInsets.only(right: 8.h), child: CustomTextFormField(controller: firstNameController, hintText: "First Name", hintStyle: CustomTextStyles.bodyMediumRegular, prefix: Container(margin: EdgeInsets.fromLTRB(9.h, 14.v, 10.h, 13.v), child: CustomImageView(imagePath: ImageConstant.imgUser, height: 18.adaptSize, width: 18.adaptSize)), prefixConstraints: BoxConstraints(maxHeight: 45.v), contentPadding: EdgeInsets.only(top: 14.v, right: 30.h, bottom: 14.v), borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8, fillColor: theme.colorScheme.primary.withOpacity(0.1)))); } 
/// Section Widget
Widget _buildLastName(BuildContext context) { return Expanded(child: Padding(padding: EdgeInsets.only(left: 8.h), child: CustomTextFormField(controller: lastNameController, hintText: "Last Name", hintStyle: CustomTextStyles.bodyMediumRegular, prefix: Container(margin: EdgeInsets.fromLTRB(9.h, 14.v, 10.h, 13.v), child: CustomImageView(imagePath: ImageConstant.imgUser, height: 18.adaptSize, width: 18.adaptSize)), prefixConstraints: BoxConstraints(maxHeight: 45.v), contentPadding: EdgeInsets.only(top: 14.v, right: 30.h, bottom: 14.v), borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8, fillColor: theme.colorScheme.primary.withOpacity(0.1)))); } 
/// Section Widget
Widget _buildFirstName1(BuildContext context) { return Row(mainAxisAlignment: MainAxisAlignment.center, children: [_buildFirstName(context), _buildLastName(context)]); } 
/// Section Widget
Widget _buildEmail(BuildContext context) { return CustomTextFormField(controller: emailController, hintText: "Email Address", hintStyle: CustomTextStyles.bodyMediumRegular, textInputType: TextInputType.emailAddress, prefix: Container(margin: EdgeInsets.fromLTRB(10.h, 14.v, 10.h, 13.v), child: CustomImageView(imagePath: ImageConstant.imgVuesaxLinearSms, height: 18.adaptSize, width: 18.adaptSize)), prefixConstraints: BoxConstraints(maxHeight: 45.v), contentPadding: EdgeInsets.only(top: 14.v, right: 30.h, bottom: 14.v), borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8, fillColor: theme.colorScheme.primary.withOpacity(0.1)); } 
/// Section Widget
Widget _buildCall(BuildContext context) { return CustomTextFormField(controller: callController, hintText: "Contact", hintStyle: CustomTextStyles.bodyMediumRegular, textInputAction: TextInputAction.done, prefix: Container(margin: EdgeInsets.fromLTRB(11.h, 15.v, 10.h, 12.v), child: CustomImageView(imagePath: ImageConstant.imgCall, height: 18.v, width: 17.h)), prefixConstraints: BoxConstraints(maxHeight: 45.v), contentPadding: EdgeInsets.only(top: 14.v, right: 30.h, bottom: 14.v), borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8, fillColor: theme.colorScheme.primary.withOpacity(0.1)); } 
/// Section Widget
Widget _buildContinues(BuildContext context) { return CustomElevatedButton(width: 280.h, text: "Continues", buttonStyle: CustomButtonStyles.fillPrimary, onPressed: () {onTapContinues(context);}); } 

/// Navigates back to the previous screen.
onTapArrowLeft(BuildContext context) { Navigator.pop(context); } 
/// Navigates to the paymentOptionOneScreen when the action is triggered.
onTapContinues(BuildContext context) { Navigator.pushNamed(context, AppRoutes.paymentOptionOneScreen); } 
 }

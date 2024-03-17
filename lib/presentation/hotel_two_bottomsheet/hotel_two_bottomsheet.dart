import 'package:flutter/material.dart';import 'package:kuddle_s_application27/core/app_export.dart';import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';import 'package:kuddle_s_application27/widgets/custom_rating_bar.dart';import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable
class HotelTwoBottomsheet extends StatelessWidget {HotelTwoBottomsheet({Key? key}) : super(key: key);

TextEditingController descriptionController = TextEditingController();

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SingleChildScrollView(child: Container(padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 21.v), decoration: AppDecoration.fillOnPrimary.copyWith(borderRadius: BorderRadiusStyle.roundedBorder13), child: Column(mainAxisSize: MainAxisSize.min, children: [SizedBox(width: 64.h, child: Divider(color: appTheme.gray400)), SizedBox(height: 24.v), Text("Rate The Hotel", style: CustomTextStyles.titleLargeBold), SizedBox(height: 50.v), _buildValeriiaBugaio(context), SizedBox(height: 55.v), Text("Please Give your rating & review ", style: CustomTextStyles.titleMediumBold), SizedBox(height: 17.v), CustomRatingBar(initialRating: 0), SizedBox(height: 24.v), CustomTextFormField(controller: descriptionController, hintText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ", hintStyle: CustomTextStyles.bodyMediumRegular_1, textInputAction: TextInputAction.done, maxLines: 3), SizedBox(height: 50.v), CustomElevatedButton(height: 45.v, text: "Rate Now", margin: EdgeInsets.symmetric(horizontal: 53.h), buttonStyle: CustomButtonStyles.fillPrimaryTL24, onPressed: () {onTapRateNow(context);}), SizedBox(height: 22.v), CustomElevatedButton(height: 45.v, text: "Cancle", margin: EdgeInsets.symmetric(horizontal: 53.h), buttonStyle: CustomButtonStyles.fillBlueTL24, onPressed: () {onTapCancle(context);}), SizedBox(height: 26.v)]))); } 
/// Section Widget
Widget _buildValeriiaBugaio(BuildContext context) { return Container(padding: EdgeInsets.symmetric(vertical: 5.v), decoration: AppDecoration.outlinePrimary.copyWith(borderRadius: BorderRadiusStyle.roundedBorder13), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.start, children: [CustomImageView(imagePath: ImageConstant.imgValeriiaBugaio3, height: 108.v, width: 116.h, radius: BorderRadius.circular(15.h)), Padding(padding: EdgeInsets.only(top: 5.v, bottom: 17.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Citoen Elysee Petrol Manual", style: theme.textTheme.titleMedium), SizedBox(height: 10.v), Row(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomImageView(imagePath: ImageConstant.imgVectorGray700, height: 13.v, width: 8.h, margin: EdgeInsets.only(top: 1.v, bottom: 16.v)), Container(width: 193.h, margin: EdgeInsets.only(left: 5.h), child: Text("3/2 Thanon Khao, Vachirapayabal, Dusit.", maxLines: 2, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodySmall))]), SizedBox(height: 6.v), SizedBox(width: 246.h, child: Row(children: [RichText(text: TextSpan(children: [TextSpan(text: " 499/", style: CustomTextStyles.labelLarge13_1), TextSpan(text: " night", style: theme.textTheme.bodyMedium)]), textAlign: TextAlign.left), Spacer(), CustomImageView(imagePath: ImageConstant.imgStarRate, height: 15.adaptSize, width: 15.adaptSize, margin: EdgeInsets.only(bottom: 2.v)), Padding(padding: EdgeInsets.only(left: 4.h), child: Text("4.9", style: theme.textTheme.labelLarge))]))]))])); } 
/// Navigates to the bookRoomDetailsScreen when the action is triggered.
onTapRateNow(BuildContext context) { Navigator.pushNamed(context, AppRoutes.bookRoomDetailsScreen); } 
/// Navigates to the bookRoomDetailsScreen when the action is triggered.
onTapCancle(BuildContext context) { Navigator.pushNamed(context, AppRoutes.bookRoomDetailsScreen); } 
 }

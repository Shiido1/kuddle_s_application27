import 'package:flutter/material.dart';import 'package:kuddle_s_application27/core/app_export.dart';import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';class NotificationsScreen extends StatelessWidget {const NotificationsScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(appBar: _buildAppBar(context), body: SizedBox(width: mediaQueryData.size.width, child: SingleChildScrollView(child: SizedBox(height: 973.v, width: double.maxFinite))))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(height: 55.v, leadingWidth: 47.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgArrowLeftPrimary, margin: EdgeInsets.only(left: 16.h), onTap: () {onTapArrowLeft(context);}), centerTitle: true, title: AppbarTitle(text: "Notifications")); } 

/// Navigates back to the previous screen.
onTapArrowLeft(BuildContext context) { Navigator.pop(context); } 
 }

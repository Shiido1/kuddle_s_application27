import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/car_page/car_page.dart';
import 'package:kuddle_s_application27/presentation/favorite_page/favorite_page.dart';
import 'package:kuddle_s_application27/presentation/last_book_tab_container_page/last_book_tab_container_page.dart';
import 'package:kuddle_s_application27/presentation/profile_one_page/profile_one_page.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_bottom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_drop_down.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  TextEditingController brooklynSimmonsController = TextEditingController();

  TextEditingController simmonsController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  TextEditingController arrowdownController = TextEditingController();

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

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
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(height: 53.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.h, right: 15.h, bottom: 63.v),
                                  child: Column(children: [
                                    _buildBrooklynSimmons(context),
                                    SizedBox(height: 23.v),
                                    _buildSimmons(context),
                                    SizedBox(height: 23.v),
                                    _buildTwelveMillionTwoHundredSeventy(
                                        context),
                                    SizedBox(height: 23.v),
                                    _buildEmail(context),
                                    SizedBox(height: 23.v),
                                    CustomDropDown(
                                        icon: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30.h, 15.v, 16.h, 14.v),
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgArrowdownPrimary,
                                                height: 24.adaptSize,
                                                width: 24.adaptSize)),
                                        hintText: "United States",
                                        items: dropdownItemList,
                                        contentPadding: EdgeInsets.only(
                                            left: 16.h,
                                            top: 18.v,
                                            bottom: 18.v),
                                        onChanged: (value) {}),
                                    SizedBox(height: 23.v),
                                    _buildArrowdown(context),
                                    SizedBox(height: 23.v),
                                    CustomDropDown(
                                        icon: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30.h, 15.v, 16.h, 14.v),
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgArrowdownPrimary,
                                                height: 24.adaptSize,
                                                width: 24.adaptSize)),
                                        hintText: "Male",
                                        items: dropdownItemList1,
                                        contentPadding: EdgeInsets.only(
                                            left: 16.h,
                                            top: 18.v,
                                            bottom: 18.v),
                                        onChanged: (value) {}),
                                    SizedBox(height: 122.v),
                                    _buildUpdate(context)
                                  ]))))
                    ]))),
            bottomNavigationBar: _buildHome(context),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked));
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
        title: AppbarTitle(
            text: "Edit Profile", margin: EdgeInsets.only(left: 14.h)));
  }

  /// Section Widget
  Widget _buildBrooklynSimmons(BuildContext context) {
    return CustomTextFormField(
        controller: brooklynSimmonsController,
        hintText: "Brooklyn Simmons",
        hintStyle: theme.textTheme.titleSmall!,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v));
  }

  /// Section Widget
  Widget _buildSimmons(BuildContext context) {
    return CustomTextFormField(
        controller: simmonsController,
        hintText: "Simmons",
        hintStyle: theme.textTheme.titleSmall!,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v));
  }

  /// Section Widget
  Widget _buildTwelveMillionTwoHundredSeventy(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 13.v),
        decoration: AppDecoration.outlineGray400
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 5.v, bottom: 2.v),
              child: Text("12/27/1995", style: theme.textTheme.titleSmall)),
          CustomImageView(
              imagePath: ImageConstant.imgCalendar,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(top: 1.v))
        ]));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "BrooklynSimmons00012@gmail.com",
        hintStyle: theme.textTheme.titleSmall!,
        textInputType: TextInputType.emailAddress,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 15.v, 16.h, 14.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgMenuPrimary,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 53.v),
        contentPadding: EdgeInsets.only(left: 16.h, top: 18.v, bottom: 18.v));
  }

  /// Section Widget
  Widget _buildArrowdown(BuildContext context) {
    return CustomTextFormField(
        controller: arrowdownController,
        hintText: "+1 123 3456 345",
        hintStyle: theme.textTheme.titleSmall!,
        textInputAction: TextInputAction.done,
        prefix: Padding(
            padding: EdgeInsets.fromLTRB(16.h, 18.v, 30.h, 18.200012.v),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              CustomImageView(
                  imagePath: ImageConstant.imageNotFound,
                  height: 15.8.v,
                  width: 30.h),
              CustomImageView(
                  imagePath: ImageConstant.imageNotFound,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  margin: EdgeInsets.fromLTRB(30.h, 18.v, 22.h, 19.v))
            ])),
        prefixConstraints: BoxConstraints(maxHeight: 53.v),
        contentPadding: EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v));
  }

  /// Section Widget
  Widget _buildUpdate(BuildContext context) {
    return CustomElevatedButton(
        width: 257.h,
        text: "Update",
        buttonStyle: CustomButtonStyles.fillPrimary,
        onPressed: () {
          onTapUpdate(context);
        });
  }

  /// Section Widget
  Widget _buildHome(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.carPage;
      case BottomBarEnum.Vuesaxlinearheart:
        return AppRoutes.favoritePage;
      case BottomBarEnum.Bag:
        return AppRoutes.lastBookTabContainerPage;
      case BottomBarEnum.User:
        return AppRoutes.profileOnePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.carPage:
        return CarPage();
      case AppRoutes.favoritePage:
        return FavoritePage();
      case AppRoutes.lastBookTabContainerPage:
        return LastBookTabContainerPage();
      case AppRoutes.profileOnePage:
        return ProfileOnePage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the bookRoomDetailsScreen when the action is triggered.
  onTapUpdate(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.bookRoomDetailsScreen);
  }
}

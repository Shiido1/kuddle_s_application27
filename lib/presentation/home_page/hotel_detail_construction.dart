import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/pages/home/model/property_list_model/property_model.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_screen/book_room_calendar_screen.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_screen/book_room_calendar_screen_original.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:kuddle_s_application27/widgets/custom_icon_button.dart';

class HotelDetailConstruction extends StatelessWidget {

  final PropertyModel property;
   HotelDetailConstruction({Key? key, required this.property}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Container(
              height: 1081.v,
              width: double.maxFinite,
              margin: EdgeInsets.only(bottom: 5.v),
              child: SingleChildScrollView(

                child: Container(
                  margin: EdgeInsets.only(bottom: 0), // Adjust margin as needed
                  padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 24.v),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSeventyFour(context),
                      Text("${property.propertyName}", style: theme.textTheme.headlineMedium?.copyWith(color: Color(0xFF003B95))),
                      SizedBox(height: 8.v),
                      _buildVector(context),
                      SizedBox(height: 27.v),
                      Divider(color: Color(0xFF003B95).withOpacity(0.7)),
                      SizedBox(height: 22.v),
                      Text("Details", style: theme.textTheme.titleMedium?.copyWith(color: Color(0xFF003B95))),
                      SizedBox(height: 27.v),
                      Container(
                        width: 385.h,
                        margin: EdgeInsets.only(right: 14.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${property.propertyName} ",
                                style: CustomTextStyles.bodySmallGray500.copyWith(color: Color(0xFF003B95)),
                              ),
                              TextSpan(
                                text: "Read More...",
                                style: CustomTextStyles.bodySmallPrimary.copyWith(color: Color(0xFF003B95)),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 23.v),
                      Text("Facilities", style: theme.textTheme.titleMedium?.copyWith(color: Color(0xFF003B95))),
                      SizedBox(height: 32.v),
                      _buildSwimmingPool(context),
                      SizedBox(height: 27.v),
                      _buildLaundry(context),
                      SizedBox(height: 27.v),  // Add space between sections
                      _buildAdditionalDetails(context),
                      SizedBox(height: 27.v),  // Add space between sections
                      _buildBookNow(context),
                    ],
                  ),
                ),
              ),

            ),
          ),
        ),

      ),
    );
  }



  Widget _buildAdditionalDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Additional Details", style: theme.textTheme.headline6?.copyWith(color: Color(0xFF003B95))),
        SizedBox(height: 16.v),
        _buildDetailItem(Icons.access_time, "Check In", "From 07:44 AM to 1:44 PM"),
        _buildDetailItem(Icons.access_time, "Check Out", "From 12:00 PM to 3:00 PM"),
        _buildDetailItem(Icons.policy, "Cancellation/prepayment", "Cancellation and prepayment policies vary according to accommodations type."),
        _buildDetailItem(Icons.child_care, "Children & Beds", "Children are not allowed in this property. No age restriction. There's no age requirement for check-in."),
        _buildDetailItem(Icons.pets, "Pets", "Pets are not allowed."),
        _buildDetailItem(Icons.smoking_rooms, "Smoking", "Smoking is not allowed."),
        _buildDetailItem(Icons.payment, "Accepted payment methods", "Cash is not accepted. Pay securely through your e-wallet."),
      ],
    );
  }

  Widget _buildDetailItem(IconData icon, String title, String content) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.v),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          colors: [Colors.white, Color(0xFFEFEFEF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
        leading: Container(
          padding: EdgeInsets.all(8.h),
          decoration: BoxDecoration(
            color: Color(0xFF003B95),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: theme.textTheme.subtitle1?.copyWith(color: Color(0xFF003B95)),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 8.v),
          child: Text(
            content,
            style: theme.textTheme.bodyText2?.copyWith(color: Color(0xFF003B95)),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventyFour(BuildContext context) {

    return Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
            height: 311.v,
            width: double.maxFinite,
            child: Stack(alignment: Alignment.topCenter, children: [
              CustomImageView(
                  // imagePath: ImageConstant.imgYuliyaPankevic,
                imagePath: ('https://api.maczuby.com/images/${property.propertyPic1}'),
                  height: 311.v,
                  width: 430.h,
                  radius: BorderRadius.circular(15.h),
                  alignment: Alignment.center),
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(15.h, 37.v, 15.h, 57.v),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgArrowLeft,
                                height: 31.adaptSize,
                                width: 31.adaptSize,
                                margin: EdgeInsets.only(bottom: 186.v),
                                onTap: () {
                                  onTapImgArrowLeft(context);
                                }),
                            CustomImageView(
                                imagePath: ImageConstant.imgGroup3,
                                height: 6.v,
                                width: 45.h,
                                margin: EdgeInsets.only(top: 211.v)),
                            Padding(
                                padding: EdgeInsets.only(bottom: 186.v),
                                child: CustomIconButton(
                                    height: 31.adaptSize,
                                    width: 31.adaptSize,
                                    padding: EdgeInsets.all(6.h),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgGroup135)))
                          ])))
            ])));
  }

  /// Section Widget
  Widget _buildVector(BuildContext context) {
    return SizedBox(
        height: 55.v,
        width: 400.h,
        child: Stack(alignment: Alignment.topRight, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorPrimary,
                          height: 15.v,
                          width: 10.h,
                          margin: EdgeInsets.only(bottom: 2.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text("${property.stateProvince}",
                              style: CustomTextStyles.bodyMediumRegular))
                    ]),
                    SizedBox(height: 13.v),
                    Row(children: [
                      Text("Review", style: theme.textTheme.titleSmall),
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorPrimarycontainer,
                          height: 11.adaptSize,
                          width: 11.adaptSize,
                          margin: EdgeInsets.only(
                              left: 10.h, top: 2.v, bottom: 3.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "4.9 ",
                                    style: CustomTextStyles.bodySmallPrimary),
                                TextSpan(
                                    text: "(10k review)",
                                    style: CustomTextStyles.bodySmallGray400)
                              ]),
                              textAlign: TextAlign.left)),
                      Spacer(),
                      Text("See All",
                          style: CustomTextStyles.bodySmallPrimary_1)
                    ])
                  ])),
          Align(
              alignment: Alignment.topRight,
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: " ₦${property.price}", style: theme.textTheme.headlineSmall),
                    TextSpan(text: " "),
                    TextSpan(
                        text: "/night",
                        style: CustomTextStyles.bodyMediumBlack900Regular)
                  ]),
                  textAlign: TextAlign.left))
        ]));
  }

  /// Section Widget
  Widget _buildSwimmingPool(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 3.h, right: 23.h),
        child: Row(children: [
          Column(children: [
            CustomImageView(
                imagePath: ImageConstant.imgGroup, height: 30.v, width: 38.h),
            SizedBox(height: 11.v),
            Text("Swimming Pool", style: CustomTextStyles.labelMediumPrimary)
          ]),
          Spacer(flex: 28),
          Column(children: [
            CustomImageView(
                imagePath: ImageConstant.imgGroupPrimary,
                height: 30.v,
                width: 36.h),
            SizedBox(height: 9.v),
            Text("Wifi", style: CustomTextStyles.labelMediumPrimary)
          ]),
          Spacer(flex: 36),
          Column(children: [
            CustomImageView(
                imagePath: ImageConstant.imgGroupPrimary30x30,
                height: 30.adaptSize,
                width: 30.adaptSize),
            SizedBox(height: 10.v),
            Text("Restaurant", style: CustomTextStyles.labelMediumPrimary)
          ]),
          Spacer(flex: 35),
          Column(children: [
            CustomImageView(
                imagePath: ImageConstant.imgFlag, height: 30.v, width: 27.h),
            SizedBox(height: 11.v),
            Text("Parking", style: CustomTextStyles.labelMediumPrimary)
          ])
        ]));
  }

  /// Section Widget
  Widget _buildLaundry(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 11.v),
                      child: Column(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgGroupPrimary30x26,
                            height: 30.v,
                            width: 26.h),
                        SizedBox(height: 11.v),
                        Text("Laundry",
                            style: CustomTextStyles.labelMediumPrimary)
                      ])),
                  Column(children: [
                    SizedBox(
                        height: 30.v,
                        width: 31.h,
                        child: Stack(alignment: Alignment.topLeft, children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgGroup159,
                              height: 30.v,
                              width: 31.h,
                              alignment: Alignment.center),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  height: 1.adaptSize,
                                  width: 1.adaptSize,
                                  margin: EdgeInsets.only(left: 14.h, top: 4.v),
                                  decoration: BoxDecoration(
                                      color: theme.colorScheme.primary)))
                        ])),
                    SizedBox(height: 9.v),
                    SizedBox(
                        width: 62.h,
                        child: Text("Conference\nRoom",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.labelMediumPrimary))
                  ]),
                  Padding(
                      padding: EdgeInsets.only(bottom: 11.v),
                      child: Column(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgFlagPrimary,
                            height: 30.v,
                            width: 48.h),
                        SizedBox(height: 11.v),
                        Text("Gym", style: CustomTextStyles.labelMediumPrimary)
                      ])),
                  Column(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgGroup30x30,
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 6.h)),
                    SizedBox(height: 10.v),
                    SizedBox(
                        width: 47.h,
                        child: Text("Wellness \nCenter",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.labelMediumPrimary))
                  ])
                ])));
  }

  /// Section Widget
  Widget _buildLocation(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Location", style: theme.textTheme.titleMedium),
                  SizedBox(height: 25.v),
                  Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder20),
                      child: Container(
                          height: 234.v,
                          width: 400.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusStyle.roundedBorder20),
                          child: Stack(alignment: Alignment.center, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgBasemapImage,
                                height: 234.v,
                                width: 400.h,
                                radius: BorderRadius.circular(20.h),
                                alignment: Alignment.center),
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgDefaultMarkerComponent,
                                height: 5.v,
                                width: 4.h,
                                radius: BorderRadius.circular(2.h),
                                alignment: Alignment.center)
                          ])))
                ])));
  }

  /// Section Widget
  Widget _buildBookNow(BuildContext context) {
    return CustomElevatedButton(
        width: 278.h,
        text: "Book Now",
        margin: EdgeInsets.only(left: 76.h, right: 76.h, bottom: 29.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookRoomCalendarScreenOriginal(property: property)
            ),);
          onTapBookNow(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the bookRoomCalendarScreen when the action is triggered.
  onTapBookNow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.bookRoomCalendarScreen);
  }
}

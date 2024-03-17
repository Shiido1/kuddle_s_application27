import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/models/booking_response.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:intl/intl.dart';
import '../../../pages/bookings/model/booking_model.dart';


// ignore: must_be_immutable
class LastbookItemWidget extends StatelessWidget {
  final Booking bookRoom;
  LastbookItemWidget({Key? key,  required this.bookRoom})
      : super(
          key: key,
        );

  String formatPrice(String? price) {
    if (price == null || price.isEmpty) {
      return '0.0';
    }

    try {
      return NumberFormat('#,##0').format(int.parse(price));
    } catch (e) {
      // Handle the parsing error gracefully
      print("Error parsing price: $e");
      return '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 5.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder13,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 40.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ('https://api.maczuby.com/images/${bookRoom.propertyPic2}'),
                  height: 108.v,
                  width: 116.h,
                  radius: BorderRadius.circular(
                    15.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 19.h,
                    top: 5.v,
                    bottom: 11.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${bookRoom.propertyName}",
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: 10.v),
                      Row(
                        children: [
                          Icon(
                            Icons.vpn_key, // Use the VpnKey icon for a key representation
                            color: Colors.blue, // Set the color of the key icon
                          ),
                          SizedBox(width: 8.0), // Add some space between the icon and the text
                          Text(
                            "Room number: ${bookRoom.roomNo}",
                            style: theme.textTheme.titleSmall,
                          ),
                        ],
                      ),


                      SizedBox(height: 10.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgVectorGray700,
                            height: 13.v,
                            width: 8.h,
                            margin: EdgeInsets.only(
                              top: 1.v,
                              bottom: 15.v,
                            ),
                          ),
                          Container(
                            width: 193.h,
                            margin: EdgeInsets.only(left: 5.h),
                            child: Text(
                              " ${bookRoom.streetAddress}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgHomePrimary,
                            height: 13.v,
                            width: 8.h,
                            margin: EdgeInsets.only(
                              top: 1.v,
                              bottom: 15.v,
                            ),
                          ),
                          Container(
                            width: 193.h,
                            margin: EdgeInsets.only(left: 5.h),
                            child: Text(
                              "${bookRoom.roomType}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 1.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgIconWallet,
                            height: 13.v,
                            width: 8.h,
                            margin: EdgeInsets.only(
                              top: 1.v,
                              bottom: 15.v,
                            ),
                          ),
                          Container(
                            width: 193.h,
                            margin: EdgeInsets.only(left: 5.h),
                            child: Text(
                              " ₦${formatPrice(bookRoom.price)}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.v),
                      CustomElevatedButton(
                        height: 22.v,
                        width: 123.h,
                        text: "Ongoing",
                        buttonStyle: CustomButtonStyles.fillBlueTL18,
                        buttonTextStyle: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          Divider(),
          SizedBox(height: 10.v),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 6.h,
              vertical: 4.v,
            ),
            decoration: AppDecoration.outlinePrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder4,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgVuesaxLinearWarning2,
                  height: 10.adaptSize,
                  width: 10.adaptSize,
                ),
            Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text(
                "This Booking is ongoing ",
                style: CustomTextStyles.bodySmallBluegray400,
              ),
            ),
              ],
            ),
          ),
          SizedBox(height: 10.v),
        ],
      ),
    );
  }
}

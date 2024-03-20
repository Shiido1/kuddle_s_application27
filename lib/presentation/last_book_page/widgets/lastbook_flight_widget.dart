import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/models/booking_response.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:intl/intl.dart';

import '../../../models/flight_response.dart';
import '../../../pages/bookings/model/booking_model.dart';

// ignore: must_be_immutable
class LastbookFlightWidget extends StatelessWidget {
  final Flight bookRoom;
  LastbookFlightWidget({Key? key, required this.bookRoom})
      : super(
          key: key,
        );

  String addCommasToNumber(String numberString) {
    final number = double.parse(numberString.replaceAll(',', ''));
    final formattedString = NumberFormat("#,##0.00").format(number);
    return formattedString;
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
                  imagePath: ('${bookRoom.flightPic2}'),
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
                        "${bookRoom.hostName}",
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: 10.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // CustomImageView(
                          //   imagePath: ImageConstant.imgVectorGray700,
                          //   height: 13.v,
                          //   width: 8.h,
                          //   margin: EdgeInsets.only(
                          //     top: 1.v,
                          //     bottom: 15.v,
                          //   ),
                          // ),

                          Container(
                            width: 193.h,
                            margin: EdgeInsets.only(left: 5.h),
                            child: Text(
                              "₦${addCommasToNumber(bookRoom.amountPaid.toString())}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9.v),
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
            decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
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
                    "This Flight Booking is ongoing ",
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

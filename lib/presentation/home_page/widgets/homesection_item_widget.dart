import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:intl/intl.dart';
import '../../../pages/home/model/property_list_model/property_model.dart';

class HomesectionItemWidget extends StatelessWidget {
  final VoidCallback? onTapImgSpain;
  final PropertyModel property; // Adjust the type based on your actual data model

  HomesectionItemWidget({
    Key? key,
    this.onTapImgSpain,
    required this.property,
  }) : super(key: key);


  String formatPrice(String? price) {
    if (price == null || price.isEmpty) {
      return '0.0';
    }

    try {
      return NumberFormat('#,##0').format(double.parse(price));
    } catch (e) {
      // Handle the parsing error gracefully
      print("Error parsing price: $e");
      return '0.0';
    }
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 300.v,
      width: 181.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            // imagePath: ImageConstant.imgValeriiaBugaio,
            imagePath: ('https://api.maczuby.com/images/${property.propertyPic2}'), // Adjust this based on your data model
            height: 200.v,
            width: 181.h,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(20.h),
            alignment: Alignment.center,
            onTap: onTapImgSpain,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 87.v),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 15.v,
              ),
              decoration: AppDecoration.gradientBlackToBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 43.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${property.propertyName?.substring(0, 13) ?? ''}...',
                          style: CustomTextStyles.labelLargeOnPrimarySemiBold,
                        ),


                        SizedBox(height: 4.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgVectorOnprimary,
                              height: 10.v,
                              width: 7.h,
                              margin: EdgeInsets.only(bottom: 2.v),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.h),
                              child: Text(
                                '${property?.country}',

                                style: CustomTextStyles.bodySmallOnPrimary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.v),
                        RichText(
                          text: TextSpan(
                            children: [

                              TextSpan(
                                text: "${property.city}",
                                style: CustomTextStyles.labelLargeOnPrimary_1,
                              ),


                              // TextSpan(
                              //   text: "₦${formatPrice(property.price)}/",
                              //   style: CustomTextStyles.labelLargeOnPrimary_1,
                              // ),
                              //
                              // TextSpan(
                              //   text: " night",
                              //   style: CustomTextStyles.bodySmallOnPrimaryLight,
                              // ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  // CustomImageView(
                  //   imagePath: ImageConstant.imgStarRate,
                  //   height: 13.adaptSize,
                  //   width: 13.adaptSize,
                  //   margin: EdgeInsets.only(top: 86.v),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     left: 2.h,
                  //     top: 87.v,
                  //     bottom: 2.v,
                  //   ),
                  //   child: Text(
                  //     property.roomId.toString(), // Adjust this based on your data model
                  //     style: theme.textTheme.labelSmall,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/custom_drop_down.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CancleBookingDialog extends StatelessWidget {
  CancleBookingDialog({Key? key})
      : super(
          key: key,
        );

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SingleChildScrollView(
      child: _buildMessage(context),
    );
  }

  /// Section Widget
  Widget _buildMessage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.h,
        right: 10.h,
        bottom: 368.v,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 35.v,
      ),
      decoration: AppDecoration.fillOnPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder33,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgVuesaxLinearCloseSquare,
            height: 24.adaptSize,
            width: 24.adaptSize,
            alignment: Alignment.centerRight,
          ),
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Text(
              "Enter reason to cancle booking",
              style: CustomTextStyles.bodyMediumRegular,
            ),
          ),
          SizedBox(height: 19.v),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              right: 14.h,
            ),
            child: CustomDropDown(
              icon: Container(
                margin: EdgeInsets.fromLTRB(30.h, 12.v, 19.h, 11.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdownPrimary,
                  height: 26.v,
                  width: 24.h,
                ),
              ),
              hintText: "Select Reason",
              hintStyle: CustomTextStyles.bodyMediumRegular,
              alignment: Alignment.center,
              items: dropdownItemList,
              contentPadding: EdgeInsets.only(
                left: 19.h,
                top: 16.v,
                bottom: 16.v,
              ),
              borderDecoration: DropDownStyleHelper.outlineGray,
              fillColor: theme.colorScheme.primary.withOpacity(0.1),
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              right: 14.h,
            ),
            child: CustomTextFormField(
              controller: messageController,
              hintText: "Enter message..",
              hintStyle: CustomTextStyles.titleSmallGray700,
              textInputAction: TextInputAction.done,
              alignment: Alignment.center,
              maxLines: 5,
            ),
          ),
          SizedBox(height: 24.v),
          Padding(
            padding: EdgeInsets.only(
              left: 46.h,
              right: 61.h,
            ),
            child: Row(
              children: [
                CustomElevatedButton(
                  height: 49.v,
                  width: 128.h,
                  text: "Cancle",
                  buttonStyle: CustomButtonStyles.fillBlueTL24,
                ),
                CustomElevatedButton(
                  height: 49.v,
                  width: 129.h,
                  text: "Submit",
                  margin: EdgeInsets.only(left: 10.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.v),
        ],
      ),
    );
  }
}

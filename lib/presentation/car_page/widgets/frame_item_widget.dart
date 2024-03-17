import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

// ignore: must_be_immutable
class FrameItemWidget extends StatelessWidget {
  const FrameItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 10.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Hotel",
        style: TextStyle(
          color: theme.colorScheme.primary,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: false,
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      // Set the selected color to green when the chip is selected
      selectedColor: Colors.green, // Change this to your desired green color
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(18.h),
      ),
      onSelected: (value) {
        // You can add any logic here that you want to execute when the chip is selected or unselected
      },
    );
  }
}

import 'package:flutter/material.dart';import 'package:kuddle_s_application27/core/app_export.dart';import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';import 'package:kuddle_s_application27/widgets/custom_drop_down.dart';import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';import 'package:table_calendar/table_calendar.dart';
// ignore_for_file: must_be_immutable
class BookRoomCalendarTwoScreen extends StatelessWidget {BookRoomCalendarTwoScreen({Key? key}) : super(key: key);

DateTime? rangeStart;

DateTime? rangeEnd;

DateTime? selectedDay;

DateTime focusedDay = DateTime.now();

RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOn;

List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

TextEditingController monthController = TextEditingController();

List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: SizedBox(width: mediaQueryData.size.width, child: SingleChildScrollView(padding: EdgeInsets.only(top: 6.v), child: Padding(padding: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 5.v), child: Column(children: [_buildCalendar(context), SizedBox(height: 23.v), _buildEightyThree(context), SizedBox(height: 101.v), CustomElevatedButton(width: 280.h, text: "Continues", buttonStyle: CustomButtonStyles.fillPrimary)])))))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(leadingWidth: 46.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgArrowLeftPrimary, margin: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 12.v), onTap: () {onTapArrowLeft(context);}), title: AppbarTitle(text: "Select Date", margin: EdgeInsets.only(left: 10.h))); } 
/// Section Widget
Widget _buildCalendar(BuildContext context) { return SizedBox(height: 247.v, width: 400.h, child: TableCalendar(locale: 'en_US', firstDay: DateTime(DateTime.now().year - 5), lastDay: DateTime(DateTime.now().year + 5), calendarFormat: CalendarFormat.month, rangeSelectionMode: rangeSelectionMode, startingDayOfWeek: StartingDayOfWeek.monday, headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true), calendarStyle: CalendarStyle(outsideDaysVisible: false, isTodayHighlighted: true, todayTextStyle: TextStyle(color: theme.colorScheme.onPrimary.withOpacity(1), fontFamily: 'Inter', fontWeight: FontWeight.w400), todayDecoration: BoxDecoration(color: theme.colorScheme.primary, borderRadius: BorderRadius.circular(14.h))), daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: TextStyle(color: appTheme.black900, fontFamily: 'Inter', fontWeight: FontWeight.w400)), headerVisible: false, rowHeight: 28.adaptSize, focusedDay: focusedDay, rangeStartDay: rangeStart, rangeEndDay: rangeEnd, onDaySelected: (selectedDay, focusedDay) {}, onRangeSelected: (start, end, focusedDay) {}, onPageChanged: (focusedDay) {})); } 
/// Section Widget
Widget _buildEightyThree(BuildContext context) { return Container(padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 19.v), decoration: AppDecoration.fillPrimary1.copyWith(borderRadius: BorderRadiusStyle.roundedBorder10), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Select Trip Type", style: theme.textTheme.titleSmall), SizedBox(height: 8.v), CustomDropDown(icon: Container(margin: EdgeInsets.fromLTRB(30.h, 9.v, 9.h, 9.v), child: CustomImageView(imagePath: ImageConstant.imgArrowdown, height: 19.adaptSize, width: 19.adaptSize)), hintText: "One Way Trip", items: dropdownItemList, onChanged: (value) {}), SizedBox(height: 25.v), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Padding(padding: EdgeInsets.only(top: 1.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Number of Passengers", style: theme.textTheme.titleSmall), SizedBox(height: 8.v), Padding(padding: EdgeInsets.only(right: 16.h), child: _buildOne(context, text: "2"))])), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Aduit", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), _buildOne(context, text: "1")])]), SizedBox(height: 25.v), Text("Check In", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), CustomTextFormField(width: 178.h, controller: monthController, hintText: "June 14", textInputAction: TextInputAction.done, borderDecoration: TextFormFieldStyleHelper.fillPrimary, fillColor: theme.colorScheme.primary), SizedBox(height: 26.v), Text("Select Driver Age", style: theme.textTheme.titleSmall), SizedBox(height: 8.v), CustomDropDown(icon: Container(margin: EdgeInsets.fromLTRB(30.h, 9.v, 9.h, 9.v), child: CustomImageView(imagePath: ImageConstant.imgArrowdown, height: 19.adaptSize, width: 19.adaptSize)), hintText: "25 to 30", items: dropdownItemList1, onChanged: (value) {}), SizedBox(height: 53.v), Align(alignment: Alignment.center, child: Text("Total Amount     900", style: theme.textTheme.titleLarge)), SizedBox(height: 20.v)])); } 
/// Common widget
Widget _buildOne(BuildContext context, {required String text, }) { return Container(width: 137.h, padding: EdgeInsets.all(9.h), decoration: AppDecoration.fillPrimary.copyWith(borderRadius: BorderRadiusStyle.roundedBorder7), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Padding(padding: EdgeInsets.only(left: 4.h, top: 2.v, bottom: 1.v), child: Text(text, style: CustomTextStyles.bodySmallOnPrimary_1.copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)))), CustomImageView(imagePath: ImageConstant.imgSwitchright, height: 19.adaptSize, width: 19.adaptSize)])); } 

/// Navigates back to the previous screen.
onTapArrowLeft(BuildContext context) { Navigator.pop(context); } 
 }

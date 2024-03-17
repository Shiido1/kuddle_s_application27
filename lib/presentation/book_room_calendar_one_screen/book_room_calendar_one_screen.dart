import 'package:flutter/material.dart';import 'package:kuddle_s_application27/core/app_export.dart';import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';import 'package:kuddle_s_application27/widgets/custom_drop_down.dart';import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';import 'package:table_calendar/table_calendar.dart';
// ignore_for_file: must_be_immutable
class BookRoomCalendarOneScreen extends StatelessWidget {BookRoomCalendarOneScreen({Key? key}) : super(key: key);

DateTime? rangeStart;

DateTime? rangeEnd;

DateTime? selectedDay;

DateTime focusedDay = DateTime.now();

RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOn;

TextEditingController timeController = TextEditingController();

TextEditingController timeController1 = TextEditingController();

List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: SizedBox(width: mediaQueryData.size.width, child: SingleChildScrollView(padding: EdgeInsets.only(top: 6.v), child: Padding(padding: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 5.v), child: Column(children: [_buildCalendar(context), SizedBox(height: 23.v), _buildEighty(context), SizedBox(height: 58.v), CustomElevatedButton(width: 280.h, text: "Continues", buttonStyle: CustomButtonStyles.fillPrimary)])))))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(leadingWidth: 46.h, leading: AppbarLeadingImage(imagePath: ImageConstant.imgArrowLeftPrimary, margin: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 12.v), onTap: () {onTapArrowLeft(context);}), title: AppbarTitle(text: "Select Date", margin: EdgeInsets.only(left: 10.h))); } 
/// Section Widget
Widget _buildCalendar(BuildContext context) { return SizedBox(height: 247.v, width: 400.h, child: TableCalendar(locale: 'en_US', firstDay: DateTime(DateTime.now().year - 5), lastDay: DateTime(DateTime.now().year + 5), calendarFormat: CalendarFormat.month, rangeSelectionMode: rangeSelectionMode, startingDayOfWeek: StartingDayOfWeek.monday, headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true), calendarStyle: CalendarStyle(outsideDaysVisible: false, isTodayHighlighted: true, todayTextStyle: TextStyle(color: theme.colorScheme.onPrimary.withOpacity(1), fontFamily: 'Inter', fontWeight: FontWeight.w400), todayDecoration: BoxDecoration(color: theme.colorScheme.primary, borderRadius: BorderRadius.circular(14.h))), daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: TextStyle(color: appTheme.black900, fontFamily: 'Inter', fontWeight: FontWeight.w400)), headerVisible: false, rowHeight: 28.adaptSize, focusedDay: focusedDay, rangeStartDay: rangeStart, rangeEndDay: rangeEnd, onDaySelected: (selectedDay, focusedDay) {}, onRangeSelected: (start, end, focusedDay) {}, onPageChanged: (focusedDay) {})); } 
/// Section Widget
Widget _buildEighty(BuildContext context) { return Container(padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 18.v), decoration: AppDecoration.fillPrimary1.copyWith(borderRadius: BorderRadiusStyle.roundedBorder10), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [Expanded(child: Padding(padding: EdgeInsets.only(right: 7.h), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Check in", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), CustomTextFormField(width: 178.h, controller: timeController, hintText: "June 14 , 10:00 AM", borderDecoration: TextFormFieldStyleHelper.fillPrimary, fillColor: theme.colorScheme.primary)]))), Expanded(child: Padding(padding: EdgeInsets.only(left: 7.h), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Check Out", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), CustomTextFormField(width: 178.h, controller: timeController1, hintText: "June 14 , 12:00 PM", textInputAction: TextInputAction.done, borderDecoration: TextFormFieldStyleHelper.fillPrimary, fillColor: theme.colorScheme.primary)])))]), SizedBox(height: 25.v), Text("Number of Member", style: theme.textTheme.titleSmall), SizedBox(height: 9.v), Container(padding: EdgeInsets.all(9.h), decoration: AppDecoration.fillPrimary.copyWith(borderRadius: BorderRadiusStyle.roundedBorder7), child: Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [Padding(padding: EdgeInsets.only(left: 4.h, top: 2.v, bottom: 1.v), child: Text("2", style: CustomTextStyles.bodySmallOnPrimary_1)), CustomImageView(imagePath: ImageConstant.imgSwitchright, height: 19.adaptSize, width: 19.adaptSize, margin: EdgeInsets.only(left: 88.h))])), SizedBox(height: 26.v), Text("Select Service Type", style: theme.textTheme.titleSmall), SizedBox(height: 8.v), CustomDropDown(icon: Container(margin: EdgeInsets.fromLTRB(30.h, 9.v, 9.h, 9.v), child: CustomImageView(imagePath: ImageConstant.imgArrowdown, height: 19.adaptSize, width: 19.adaptSize)), hintText: "Luxury", items: dropdownItemList, onChanged: (value) {}), SizedBox(height: 51.v), Align(alignment: Alignment.center, child: Text("Total Amount     900", style: theme.textTheme.titleLarge)), SizedBox(height: 23.v)])); } 

/// Navigates back to the previous screen.
onTapArrowLeft(BuildContext context) { Navigator.pop(context); } 
 }

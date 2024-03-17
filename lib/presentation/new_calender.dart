import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_drop_down.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore_for_file: must_be_immutable
class BookRoomCalendarrScreen extends StatefulWidget {
  BookRoomCalendarrScreen({Key? key}) : super(key: key);

  @override
  State<BookRoomCalendarrScreen> createState() => _BookRoomCalendarrScreenState();
}

class _BookRoomCalendarrScreenState extends State<BookRoomCalendarrScreen> {
  DateTime? rangeStart;

  DateTime? rangeEnd;

  DateTime? selectedDay;

  DateTime focusedDay = DateTime.now();

  RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOn;

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  TextEditingController monthController = TextEditingController();

  TextEditingController monthController1 = TextEditingController();

  int numberOfDays = 0; // Initialize to a default value
  double initialCostOfRoom = 0;
  double percentageCostAdded = 0;
  double costOfOneRoom = 30000.00;




  @override
  Widget build(BuildContext context) {
    int numberOfDays = _calculateNumberOfDays();
    double finalTotal = calculateFinalTotal(numberOfDays.toDouble());
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 6.v),
                  child: Column(children: [
                    _buildCalendar(context),
                    SizedBox(height: 23.v),
                    _buildFiftySeven(context),
                    SizedBox(height: 5.v)
                  ])),
            ),
            bottomNavigationBar: _buildContinues(context)));
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
            text: "Select Date", margin: EdgeInsets.only(left: 10.h)));
  }


  int clickCount = 0;



  void _onRangeSelectedRange(DateTime? start, DateTime? end, DateTime currentDay) {
    setState(() {
      clickCount++;

      if (clickCount == 1) {
        // First click, set the start date
        rangeStart = start;
        rangeEnd = null;
      } else {
        // Second click, set the end date
        rangeEnd = end;
        focusedDay = currentDay;

        // Reset click count for the next selection
        clickCount = 0;
      }
    });

    // If it's the second click, calculate the number of days and show the alert
    if (clickCount == 0) {
      int numberOfDays = _calculateNumberOfDays();
      // _showNumberOfDaysAlert(numberOfDays);
    }
  }

  double calculateFinalTotal(double numberOfDays) {
    // Multiply the number of days by 30,000
    double initialTotal = numberOfDays * costOfOneRoom;
     initialCostOfRoom = initialTotal;


    // Add 15% of the new total
    double finalTotal = initialTotal + (initialTotal * 0.15);
    percentageCostAdded = finalTotal - initialTotal ;

    return finalTotal;
  }


  int _calculateNumberOfDays() {
    if (rangeStart != null && rangeEnd != null) {
      // Calculate the difference in days
      final difference = rangeEnd!.difference(rangeStart!).inDays;

      // Add 1 because you want to include both the start and end days
      return difference + 1;
    }

    // Return 0 if either rangeStart or rangeEnd is null
    return 0;
  }

  void _showNumberOfDaysAlert(int numberOfDays) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Number of Selected Days'),
          content: Text('You selected $numberOfDays days.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }




  /// Section Widget
  Widget _buildCalendar(BuildContext context) {
    return SizedBox(
      height: 247.v,
      width: 400.h,
      child: TableCalendar(
          locale: 'en_US',
          firstDay: DateTime(DateTime.now().year - 5),
          lastDay: DateTime(DateTime.now().year + 5),
          calendarFormat: CalendarFormat.month,
          rangeSelectionMode: rangeSelectionMode,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle:
          HeaderStyle(formatButtonVisible: false, titleCentered: true),
          calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              isTodayHighlighted: true,
              todayTextStyle: TextStyle(
                  color: theme.colorScheme.onPrimary.withOpacity(1),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400),
              todayDecoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(14.h))),
          daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                  color: appTheme.black900,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400)),
          headerVisible: false,
          rowHeight: 45.adaptSize,
          focusedDay: focusedDay,
          rangeStartDay: rangeStart,
          rangeEndDay: rangeEnd,

          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              this.selectedDay = selectedDay;
              // Add your logic here based on the selected day
            });
          },

          onRangeSelected: (start, end, focusedDay) {
            _onRangeSelectedRange(start, end, focusedDay);
          },
          onPageChanged: (focusedDay) {}),);
  }







  /// Section Widget
  Widget _buildFiftySeven(BuildContext context) {
    int numberOfDays = _calculateNumberOfDays();
    double finalTotal = calculateFinalTotal(numberOfDays.toDouble());
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'en_US', symbol: '\₦', decimalDigits: 2);
    final NumberFormat commaSeparatedFormat = NumberFormat('#,###');


    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 18.v),
        decoration: AppDecoration.fillPrimary1
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Number of Room", style: theme.textTheme.titleSmall),
              SizedBox(height: 9.v),
              CustomDropDown(
                  width: 137.h,
                  icon: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 9.v, 9.h, 9.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgSwitchright,
                          height: 19.adaptSize,
                          width: 19.adaptSize)),
                  hintText: "2",
                  items: dropdownItemList,
                  onChanged: (value) {})
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Aduit", style: theme.textTheme.titleSmall),
              SizedBox(height: 9.v),
              CustomDropDown(
                  width: 137.h,
                  icon: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 9.v, 9.h, 9.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgSwitchright,
                          height: 19.adaptSize,
                          width: 19.adaptSize)),
                  hintText: "1",
                  items: dropdownItemList1,
                  onChanged: (value) {})
            ])
          ]),
          SizedBox(height: 25.v),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Check In", style: theme.textTheme.titleSmall),
              SizedBox(height: 9.v),
              CustomTextFormField(
                  width: 114.h,
                  controller: monthController,
                  hintText: "June 14",
                  borderDecoration: TextFormFieldStyleHelper.fillPrimary,
                  fillColor: theme.colorScheme.primary)
            ]),
            CustomImageView(
                imagePath: ImageConstant.imgGroup193,
                height: 11.v,
                width: 28.h,
                margin: EdgeInsets.only(top: 39.v, bottom: 13.v)),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Check Out", style: theme.textTheme.titleSmall),
              SizedBox(height: 9.v),
              CustomTextFormField(
                  width: 114.h,
                  controller: monthController1,
                  hintText: "June 18",
                  textInputAction: TextInputAction.done,
                  borderDecoration: TextFormFieldStyleHelper.fillPrimary,
                  fillColor: theme.colorScheme.primary)
            ])
          ]),
          SizedBox(height: 34.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Total Guest", style: theme.textTheme.titleSmall)),
          SizedBox(height: 12.v),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 21.h),
              padding: EdgeInsets.symmetric(horizontal: 96.h, vertical: 8.v),
              decoration: AppDecoration.outlineGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 31.adaptSize,
                        width: 31.adaptSize,
                        margin: EdgeInsets.only(top: 1.v),
                        padding: EdgeInsets.all(5.h),
                        decoration: AppDecoration.fillPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder7),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgRemove,
                            height: 20.v,
                            width: 19.h,
                            alignment: Alignment.center)),
                    Padding(
                        padding: EdgeInsets.only(top: 6.v, bottom: 4.v),
                        child:
                        Text("5", style: CustomTextStyles.titleMedium17)),
                    Container(
                        height: 31.adaptSize,
                        width: 31.adaptSize,
                        margin: EdgeInsets.only(top: 1.v),
                        padding: EdgeInsets.all(5.h),
                        decoration: AppDecoration.fillPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder7),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgAdd,
                            height: 20.v,
                            width: 19.h,
                            alignment: Alignment.center))
                  ])),
          SizedBox(height: 29.v),



          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // No. of Days Selected
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'No. of Days Selected:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${_calculateNumberOfDays()} Days',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 15),

              // Cost of Room
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cost of Room:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${_calculateNumberOfDays()} X ${currencyFormat.format(costOfOneRoom.toInt())}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '= ${currencyFormat.format(initialCostOfRoom.toInt())}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),

              // Percentage Cost
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Percentage Cost (15%):',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '+ ${currencyFormat.format(percentageCostAdded.toInt())}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 15),

              // Final Total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Final Total:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '= ${currencyFormat.format(finalTotal.toInt())}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),



          SizedBox(height: 18.v)
        ]));
  }

  /// Section Widget
  Widget _buildContinues(BuildContext context) {
    return CustomElevatedButton(
        width: 280.h,
        text: "Continues",
        margin: EdgeInsets.only(left: 75.h, right: 75.h, bottom: 54.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        onPressed: () {
          onTapContinues(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the bookRoomDetailsScreen when the action is triggered.
  onTapContinues(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.bookRoomDetailsScreen);
  }
}

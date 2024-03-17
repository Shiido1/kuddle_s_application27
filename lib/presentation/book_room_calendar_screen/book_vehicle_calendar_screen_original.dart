import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:intl/intl.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/payment_sucess_screen/payment_sucess_screen.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../main_core/session_manager.dart';
import '../../pages/home/model/vehicle_list_model/vehicle_model.dart';
import '../../services/provider/provider_services.dart';

// ignore_for_file: must_be_immutable
class BookVehicleCalendarScreenOriginal extends StatefulWidget {
  final VehicleModel vehicle;
  BookVehicleCalendarScreenOriginal({Key? key, required this.vehicle }) : super(key: key);

  @override
  State<BookVehicleCalendarScreenOriginal> createState() => _BookVehicleCalendarScreenState();
}

class _BookVehicleCalendarScreenState extends State<BookVehicleCalendarScreenOriginal> {
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
  double percentageCostVat = 0;
  double percentageCostCity = 0;
  double costOfOneRoom = 30000.00;
  final PageController _pageController = PageController();

  final payStackClient = PaystackPlugin();

  getAuthUserID() async {
    String? userID = SessionManager.instance.authUserID;
    return userID;
  }


  void addOrder(context) async {

    // setState(() {});

    DateTime now = DateTime.now();
    String formattedDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    String formattedTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
    var userId = await getAuthUserID();
    providerServices?.addOrder(
        map: {
          // "amountPaid":'${finalTotalMade}',
          // "bookingFor":"Room",
          // "checkInDate":"2023-10-20",
          // "checkInTime": "2023-10-20",
          // "checkOutDate":"2023-10-20",
          // "checkOutTime":"2023-10-20",
          // "duration":"2",
          // "hostID":'${widget.property.hostId}',
          // "itemID": '${widget.property.roomId}',
          // "itemType":"accommodation",
          // "itemUnitPrice":'${widget.property.price}',
          // "tickets":0.toString(),
          // "userID":36.toString(),
          // "roomID": '${widget.property.roomId}',
          // "paymentStatus": "1",
          // "delivery_charge": 1500.toString()

          "amountPaid":finalTotalMade.toString(),
          "bookingFor":"Room",
          "checkInDate":"2023-10-20",
          "checkInTime": "2023-10-20",
          "checkOutDate":"2023-10-20",
          "checkOutTime":"",
          "duration":"2",
          "hostID":4.toString(),
          "itemID": widget.vehicle.vehicleId.toString(),
          "itemType":"vehicle",
          "itemUnitPrice":widget.vehicle.price.toString(),
          "tickets":0.toString(),
          "userID":"$userId",
          "roomID": 1.toString(),
          "paymentStatus": "1",
          "delivery_charge": 1500.toString()
        },
        context: context);

    // ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    //   content: AutoSizeText('Adding Product..'),
    //   duration: const Duration(seconds: 10),
    //   action: SnackBarAction(
    //     label: 'ACTION',
    //     onPressed: () {},
    //   ),
    // ));

    // providerServices?.cartlist();
  }

  void _startPaystack() async {
    // await dotenv.load(fileName: '.env');
    // String? publicKey = dotenv.env['PUBLIC_KEY'];
    payStackClient.initialize(publicKey: 'pk_test_7553303bab0cb7acba1834f15fe274a3d624188a');
  }

  final snackBarSuccess = const SnackBar(
    content: Text('Payment Successful, Thanks for your patronage !'),
  );

  final snackBarFailure = const SnackBar(
    content: Text('Payment Unsuccessful, Please Try Again.'),
  );

  final String reference =
      "unique_transaction_ref_${Random().nextInt(1000000000)}";

  void _makePayment(int amount) async {

    double price = finalTotalMade ?? 0.0;

    final Charge charge = Charge()
      ..amount = (price * 100).round()
      ..email = 'poco@gmail.com'
      ..reference = reference;

    final CheckoutResponse response = await payStackClient.checkout(context,
        charge: charge, method: CheckoutMethod.card);

    print('object....${response.toString}');

    if (response.status && response.reference == reference) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
      addOrder(context);
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => const PaymentSucessScreen(),
        ),
      );
      print('object....$response');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBarFailure);
    }
  }


  DateTime departureDate = DateTime.now();
  TimeOfDay departureTime = TimeOfDay.now();
  DateTime returningDate = DateTime.now();
  TimeOfDay returningTime = TimeOfDay.now();


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  ProviderServices? providerServices;

  late double finalTotalMade;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    var price = double.tryParse(widget.vehicle.price ?? '0.0') ?? 0.0;
    costOfOneRoom = price;

    _startPaystack();
  }
  @override
  Widget build(BuildContext context) {
    int numberOfDays = _calculateNumberOfDays();
    double finalTotal = calculateFinalTotal(numberOfDays.toDouble());
    finalTotalMade = finalTotal;
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
                    // _buildCalendar(context),

                    DepartureDateTimeCard(
                      title: 'Departure',
                      date: departureDate,
                      time: departureTime,

                      onDateChanged: (date) => setState(() => departureDate = date),
                      onTimeChanged: (time) => setState(() => departureTime = time),
                    ),
                    SizedBox(height: 16),
                    DepartureDateTimeCard(
                      title: 'Returning',
                      date: returningDate,
                      time: returningTime,
                      onDateChanged: (date) => setState(() => returningDate = date),
                      onTimeChanged: (time) => setState(() => returningTime = time),
                    ),
                    SizedBox(height: 16),
                    SizedBox(height: 23.v),
                    _buildFiftySeven(context),
                    SizedBox(height: 5.v)
                  ])),
            ),
            bottomNavigationBar:  _calculateNumberOfDays() == 0 ? Text('') : _buildContinues(context)));
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
    double tenpercentCost = initialTotal + (initialTotal * 0.10);
    double fivepercentCost = initialTotal + (initialTotal * 0.05);
    percentageCostVat = fivepercentCost - initialTotal ;
    percentageCostCity = tenpercentCost - initialTotal;

    return finalTotal;
  }


  int _calculateNumberOfDays() {
    if (rangeStart != null && rangeEnd != null) {
      // Calculate the difference in days
      rangeEnd = returningDate;
      rangeStart = departureDate;
      final difference = rangeEnd!.difference(rangeStart!).inDays;

      // returningDate.difference(departureDate).inDays;

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


    DateTime firsDay = DateTime(DateTime.now().year - 5);
    DateTime lastDay = DateTime(DateTime.now().year + 5);
    return SizedBox(
      height: 350.v,
      width: 400.h,
      child: TableCalendar(
        locale: 'en_US',
        firstDay: DateTime(DateTime.now().year - 5),
        lastDay: DateTime(DateTime.now().year + 5),
        calendarFormat: CalendarFormat.month,
        rangeSelectionMode: rangeSelectionMode,
        startingDayOfWeek: StartingDayOfWeek.monday,

        headerVisible: true,

        headerStyle:
        HeaderStyle(formatButtonVisible: true, titleCentered: true),
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

        rowHeight: 45.adaptSize,
        focusedDay: focusedDay,
        rangeStartDay: rangeStart,
        rangeEndDay: rangeEnd,
        availableCalendarFormats: const {
          CalendarFormat.month : 'Month'
        },
        onPageChanged: (focusedDay) {
          // Get the current visible month and update the page controller
          DateTime visibleMonth = DateTime(focusedDay.year, focusedDay.month);
          _pageController.jumpTo(
            _pageController.position.maxScrollExtent *
                (visibleMonth.difference(firsDay).inDays /
                    firsDay.difference(lastDay).inDays),
          );
        },



        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            this.selectedDay = selectedDay;
            // Add your logic here based on the selected day
          });
        },

        onRangeSelected: (start, end, focusedDay) {
          _onRangeSelectedRange(start, end, focusedDay);
        },
        // onPageChanged: (focusedDay) {},
      ),
    );
  }







  /// Section Widget
  Widget _buildFiftySeven(BuildContext context) {
    int numberOfDays = _calculateNumberOfDays();
     // numberOfDays = returningDate.difference(departureDate).inDays;
    double finalTotal = calculateFinalTotal(numberOfDays.toDouble());
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'en_US', symbol: '\₦', decimalDigits: 2);
    final NumberFormat commaSeparatedFormat = NumberFormat('#,###');


    return _calculateNumberOfDays() == 0 ? Text('') : Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 18.v),
        decoration: AppDecoration.fillPrimary1
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //   Text("Number of Room", style: theme.textTheme.titleSmall),
            //   SizedBox(height: 9.v),
            //   CustomDropDown(
            //       width: 137.h,
            //       icon: Container(
            //           margin: EdgeInsets.fromLTRB(30.h, 9.v, 9.h, 9.v),
            //           child: CustomImageView(
            //               imagePath: ImageConstant.imgSwitchright,
            //               height: 19.adaptSize,
            //               width: 19.adaptSize)),
            //       hintText: "2",
            //       items: dropdownItemList,
            //       onChanged: (value) {})
            // ]),
            // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //   Text("Aduit", style: theme.textTheme.titleSmall),
            //   SizedBox(height: 9.v),
            //   CustomDropDown(
            //       width: 137.h,
            //       icon: Container(
            //           margin: EdgeInsets.fromLTRB(30.h, 9.v, 9.h, 9.v),
            //           child: CustomImageView(
            //               imagePath: ImageConstant.imgSwitchright,
            //               height: 19.adaptSize,
            //               width: 19.adaptSize)),
            //       hintText: "1",
            //       items: dropdownItemList1,
            //       onChanged: (value) {})
            // ])
          ]),
          SizedBox(height: 25.v),

          // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //   Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //     Text("Check In", style: theme.textTheme.titleSmall),
          //     SizedBox(height: 9.v),
          //     CustomTextFormField(
          //         width: 114.h,
          //         controller: monthController,
          //         hintText: "June 14",
          //         borderDecoration: TextFormFieldStyleHelper.fillPrimary,
          //         fillColor: theme.colorScheme.primary)
          //   ]),
          //   CustomImageView(
          //       imagePath: ImageConstant.imgGroup193,
          //       height: 11.v,
          //       width: 28.h,
          //       margin: EdgeInsets.only(top: 39.v, bottom: 13.v)),
          //   Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //     Text("Check Out", style: theme.textTheme.titleSmall),
          //     SizedBox(height: 9.v),
          //     CustomTextFormField(
          //         width: 114.h,
          //         controller: monthController1,
          //         hintText: "June 18",
          //         textInputAction: TextInputAction.done,
          //         borderDecoration: TextFormFieldStyleHelper.fillPrimary,
          //         fillColor: theme.colorScheme.primary)
          //   ])
          // ]),
          // SizedBox(height: 34.v),
          // Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text("Total Guest", style: theme.textTheme.titleSmall)),
          // SizedBox(height: 12.v),
          // Container(
          //     margin: EdgeInsets.symmetric(horizontal: 21.h),
          //     padding: EdgeInsets.symmetric(horizontal: 96.h, vertical: 8.v),
          //     decoration: AppDecoration.outlineGray
          //         .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
          //     child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Container(
          //               height: 31.adaptSize,
          //               width: 31.adaptSize,
          //               margin: EdgeInsets.only(top: 1.v),
          //               padding: EdgeInsets.all(5.h),
          //               decoration: AppDecoration.fillPrimary.copyWith(
          //                   borderRadius: BorderRadiusStyle.roundedBorder7),
          //               child: CustomImageView(
          //                   imagePath: ImageConstant.imgRemove,
          //                   height: 20.v,
          //                   width: 19.h,
          //                   alignment: Alignment.center)),
          //           Padding(
          //               padding: EdgeInsets.only(top: 6.v, bottom: 4.v),
          //               child:
          //               Text("5", style: CustomTextStyles.titleMedium17)),
          //           Container(
          //               height: 31.adaptSize,
          //               width: 31.adaptSize,
          //               margin: EdgeInsets.only(top: 1.v),
          //               padding: EdgeInsets.all(5.h),
          //               decoration: AppDecoration.fillPrimary.copyWith(
          //                   borderRadius: BorderRadiusStyle.roundedBorder7),
          //               child: CustomImageView(
          //                   imagePath: ImageConstant.imgAdd,
          //                   height: 20.v,
          //                   width: 19.h,
          //                   alignment: Alignment.center))
          //         ])),
          SizedBox(height: 29.v),


          _calculateNumberOfDays() == 0 ? Text('') :
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
                    'Cost of Vehicle:',
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
                    'Vat (5%):',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '+ ${currencyFormat.format(percentageCostVat)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 15),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'City Tax (10%):',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '+ ${currencyFormat.format(percentageCostCity)}',
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

          _makePayment(20000);

          // Create an instance of PayWithPayStack
          // PayWithPayStack payStackInstance = PayWithPayStack();

          //
          //
          // payStackInstance.now(
          //   context: context,
          //   secretKey: "sk_test_09f2c897bc62492bbc0df3fe2f2e1cf1e42d7a54",
          //   customerEmail: "popekabu@gmail.com",
          //   reference: DateTime.now().microsecondsSinceEpoch.toString(),
          //   currency: "NGN",
          //   amount: "20000",
          //   transactionCompleted: () {
          //     onTapContinues(context);
          //     print("Transaction Successful");
          //     Navigator.push(context, MaterialPageRoute(builder: (builder) => PaymentSucessScreen()));
          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successful')));
          //   },
          //   transactionNotCompleted: () {
          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Unsuccessful')));
          //     print("Transaction Not Successful!");
          //   },
          //   callbackUrl: '/',
          // );


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

class DepartureDateTimeCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final TimeOfDay time;
  final Function(DateTime) onDateChanged;
  final Function(TimeOfDay) onTimeChanged;


  DepartureDateTimeCard({
    required this.title,
    required this.date,
    required this.time,
    required this.onDateChanged,
    required this.onTimeChanged,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title Date & Time',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF006CE3), // Royal Blue
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Date',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 19,),
                      DatePickerWidget(
                        initialDate: date,
                        onDateChanged: onDateChanged,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Time',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 18),
                      TimePickerWidget(
                        initialTime: time,
                        onTimeChanged: onTimeChanged,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DatePickerWidget extends StatelessWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateChanged;

  const DatePickerWidget({
    required this.initialDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2101),
        );

        if (pickedDate != null && pickedDate != initialDate) {
          onDateChanged(pickedDate);

        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(25), backgroundColor: Color(0xFFFFB700), // Royal Blue
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.date_range,
            color: Colors.white,
          ),
          Text(
            '${initialDate.toLocal()}'.split(' ')[0],
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}


class TimePickerWidget extends StatelessWidget {
  final TimeOfDay initialTime;
  final Function(TimeOfDay) onTimeChanged;

  TimePickerWidget({
    required this.initialTime,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showTimeInputDialog(context);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(25), backgroundColor: Color(0xffFFB700), // Royal Blue
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.access_time,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            _formatTimeOfDay(initialTime),
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Helvetica', // Add sophistication with a custom font
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showTimeInputDialog(BuildContext context) async {
    TimeOfDay selectedTime = initialTime;

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(
                'Select Time',
                style: TextStyle(
                  fontFamily: 'Georgia',
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTimePicker(
                        context,
                        selectedTime.hour,
                            (value) {
                          setState(() {
                            selectedTime = TimeOfDay(hour: value, minute: selectedTime.minute);
                          });
                        },
                      ),
                      _buildTimePicker(
                        context,
                        selectedTime.minute,
                            (value) {
                          setState(() {
                            selectedTime = TimeOfDay(hour: selectedTime.hour, minute: value);
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          onTimeChanged(selectedTime);
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4CAF50), // Green
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTimePicker(BuildContext context, int value, ValueChanged<int> onChanged) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            int newValue = (value + 1) % (value == 23 ? 24 : 60);
            onChanged(newValue);
          },
          icon: Icon(Icons.arrow_drop_up),
        ),
        Text(
          value.toString().padLeft(2, '0'),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {
            int newValue = (value - 1 + (value == 0 ? 24 : 60)) % (value == 0 ? 24 : 60);
            onChanged(newValue);
          },
          icon: Icon(Icons.arrow_drop_down),
        ),
      ],
    );
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}



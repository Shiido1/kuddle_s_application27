import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:intl/intl.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/pages/home/model/property_list_model/property_model.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_screen/payment_choice_screen.dart';
import 'package:kuddle_s_application27/presentation/payment_sucess_screen/payment_sucess_screen.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_drop_down.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../main_core/session_manager.dart';
import '../../pages/home/model/flight_list_model/flight_model.dart';
import '../../services/provider/provider_services.dart';

// ignore_for_file: must_be_immutable
class BookFlightCalendarScreenOriginal extends StatefulWidget {
  final FlightModel flight;
  BookFlightCalendarScreenOriginal({Key? key, required this.flight }) : super(key: key);

  @override
  State<BookFlightCalendarScreenOriginal> createState() => _BookFlightCalendarScreenState();
}

class _BookFlightCalendarScreenState extends State<BookFlightCalendarScreenOriginal> {
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
var userId = await getAuthUserID();
    DateTime now = DateTime.now();
    String formattedDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    String formattedTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

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
          "itemID": widget.flight.flightId.toString(),
          "itemType":"flight",
          "itemUnitPrice":widget.flight.price.toString(),
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
    var price = double.tryParse(widget.flight.price ?? '0.0') ?? 0.0;
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
                    _buildCalendar(context),
                    SizedBox(height: 23.v),
                    _buildFiftySeven(context),
                    SizedBox(height: 5.v)
                  ])),
            ),
            bottomNavigationBar:  _calculateNumberOfDays() == 0 ? Text('') : _buildContinues(context)));
  }

  DateTime? departureDate;
  TimeOfDay? departureTime;
  DateTime? returningDate;
  TimeOfDay? returningTime;
  int numberOfPassengers = 1;

  @override
  Widget buildV(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Guest selection (You can replace this with your actual guest selection UI)
        Text("Who are you booking for?"),
        // Add your guest selection widget here

        // Number of Adults
        Text("Adult(s)"),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (numberOfPassengers > 1) {
                    numberOfPassengers--;
                  }
                });
              },
            ),
            Text("$numberOfPassengers"),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  numberOfPassengers++;
                });
              },
            ),
          ],
        ),

        // Number of Children (You can add your UI for children selection)
        Text("Children"),
        // Add your children selection widget here

        // Booking Details
        Text("Booking Details"),

        // Departure Date
        Text("Departure Date"),
        ElevatedButton(
          onPressed: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );

            if (pickedDate != null && pickedDate != departureDate) {
              setState(() {
                departureDate = pickedDate;
              });
            }
          },
          child: Text(
            departureDate != null
                ? "${departureDate!.day}/${departureDate!.month}/${departureDate!.year}"
                : "Select Date",
          ),
        ),

        // Departure Time (You can customize this based on your requirements)
        Text("Departure Time"),
        ElevatedButton(
          onPressed: () async {
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (pickedTime != null && pickedTime != departureTime) {
              setState(() {
                departureTime = pickedTime;
              });
            }
          },
          child: Text(
            departureTime != null
                ? "${departureTime!.hour}:${departureTime!.minute}"
                : "Select Time",
          ),
        ),

        // Returning Date
        Text("Returning Date"),
        ElevatedButton(
          onPressed: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );

            if (pickedDate != null && pickedDate != returningDate) {
              setState(() {
                returningDate = pickedDate;
              });
            }
          },
          child: Text(
            returningDate != null
                ? "${returningDate!.day}/${returningDate!.month}/${returningDate!.year}"
                : "Select Date",
          ),
        ),

        // Returning Time (You can customize this based on your requirements)
        Text("Returning Time"),
        ElevatedButton(
          onPressed: () async {
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (pickedTime != null && pickedTime != returningTime) {
              setState(() {
                returningTime = pickedTime;
              });
            }
          },
          child: Text(
            returningTime != null
                ? "${returningTime!.hour}:${returningTime!.minute}"
                : "Select Time",
          ),
        ),

        // Total length of stay (You can calculate this based on the selected dates)
        Text("Total length of stay"),
        Text(
          calculateLengthOfStay(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        // Additional Booking Details
        // Add your additional booking details fields here
      ],
    );
  }

  String calculateLengthOfStay() {
    if (departureDate != null && returningDate != null) {
      final difference = returningDate!.difference(departureDate!);
      return "${difference.inDays} day(s)";
    }

    return "N/A";
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
                    'Cost of Flight:',
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

          // _makePayment(20000);
          Navigator.push(context, MaterialPageRoute(builder: (builder) =>
              PaymentChoiceScreen(finalPaymentMode: finalTotalMade,
              itemType: "flight", id: widget.flight.flightId.toString(),
              price: widget.flight.price.toString())));

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

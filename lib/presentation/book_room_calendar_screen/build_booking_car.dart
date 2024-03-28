import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_screen/payment_choice_screen.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../main_core/session_manager.dart';
import '../../pages/home/model/flight_list_model/flight_model.dart';
import '../../pages/home/model/vehicle_list_model/vehicle_model.dart';
import '../../services/provider/provider_services.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/flush_bar.dart';
import '../payment_sucess_screen/payment_sucess_screen.dart';
import 'package:intl/intl.dart';

class CarBookingWidget extends StatefulWidget {
  final VehicleModel vehicle;
  CarBookingWidget({Key? key, required this.vehicle}) : super(key: key);

  @override
  _CarBookingWidgetState createState() => _CarBookingWidgetState();
}

class _CarBookingWidgetState extends State<CarBookingWidget> {
  int adultCount = 1;
  int childrenCount = 0;
  DateTime departureDate = DateTime.now();
  TimeOfDay departureTime = TimeOfDay.now();
  DateTime returningDate = DateTime.now();
  TimeOfDay returningTime = TimeOfDay.now();
  double totalPrice = 0;
  double baseFlightPrice = 1000000; // Replace with your actual flight price
  double childPrice = 20.0; // Replace with your actual child price
  double infantPrice = 40.0; // Replace with your actual infant price
  String bookingFor = 'Myself';

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

    var price = totalPrice;
    DateTime now = DateTime.now();
    String formattedDate =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    String formattedTime =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
    var $userId = getAuthUserID();
    providerServices?.addOrder(map: {
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

      "amountPaid": finalTotalMade.toString(),
      "bookingFor": "vehicle",
      "checkInDate": departureDate.toString(),
      "checkInTime": departureTime.toString(),
      "checkOutDate": returningDate.toString(),
      "checkOutTime": returningTime.toString(),
      "duration": numberOfDays.toString(),
      "hostID": 4.toString(),
      "itemID": widget.vehicle.vehicleId.toString(),
      "itemType": "vehicle",
      "itemUnitPrice": widget.vehicle.price.toString(),
      "tickets": 0.toString(),
      "userID": "$userId",
      "roomID": 1.toString(),
      "paymentStatus": "1",
      "delivery_charge": 1500.toString()
    }, context: context);

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
    payStackClient.initialize(
        publicKey: 'pk_test_7553303bab0cb7acba1834f15fe274a3d624188a');
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
    double price = finalTotalMade;

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

  double finalTotalMade = 0;
  double totalFlightPrice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    var price = double.tryParse(widget.vehicle.price ?? '0.0') ?? 0.0;
    costOfOneRoom = price;
    providerServices?.finalDetailPrice = 0;
    _startPaystack();
  }

  void onDataFromChild(double finalTotalMade) {
    // Handle the data received from the child widget

    this.finalTotalMade = finalTotalMade;
    print("Final Total Made received from child: $finalTotalMade");
  }

  checkBookedDate(context) {
    var vDepartureDate = DateFormat('E MMM dd yyyy').format(departureDate);
    var vReturningDate = DateFormat('E MMM dd yyyy').format(returningDate);
    for (var element in providerServices!.vehicleListModel!.result!) {
      if (element.bookedDates!.contains('$vDepartureDate') ||
          element.bookedDates!.contains('$vReturningDate')) {
        AppUtils.snackbar(context,
            message: "Sorry, You can't book already booked dates!",
            error: true);
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => PaymentChoiceScreen(
                    finalPaymentMode: finalTotalMade.toDouble(),
                    itemType: "vehicle",
                    id: widget.vehicle.vehicleId.toString(),
                    hostID: widget.vehicle.hostId.toString(),
                    roomID: widget.vehicle.vehicleId.toString(),
                    itemID: widget.vehicle.vehicleId.toString(),
                    checkInDate: departureDate.toString(),
                    checkInTime: departureTime.toString(),
                    checkOutDate: returningDate.toString(),
                    checkOutTime: returningTime.toString(),
                    numberOfDays: numberOfDays.toString(),
                    price: widget.vehicle.price.toString())));
      }

      print('calendar date1......${element.bookedDates}');
      print('calendar date..3.....${returningDate}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Booking Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Example usage:
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 10),
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   decoration: BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(
              //         color: Colors.grey, // You can customize the color
              //         width: 0.0, // You can customize the width
              //       ),
              //     ),
              //   ),
              //   child: Text(
              //     'Who are you Booking for?',
              //     style: TextStyle(
              //       fontSize: 10,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.grey, // You can customize the color
              //     ),
              //   ),
              // ),

              // RoundedDropdownButton(
              //   value: bookingFor,
              //   items: ['Myself', 'For Someone Else'],
              //   onChanged: (String? newValue) {
              //     if (newValue != null) {
              //       setState(() {
              //         bookingFor = newValue;
              //       });
              //     }
              //   },
              //   accessibilityLabel: 'Booking For',
              // ),

              // SizedBox(height: 16),

              DepartureDateTimeCard(
                title: 'Vehicle Booking Start',
                date: departureDate,
                time: departureTime,
                onDateChanged: (date) => setState(() => departureDate = date),
                onTimeChanged: (time) => setState(() => departureTime = time),
              ),
              SizedBox(height: 16),
              DepartureDateTimeCard(
                title: 'Vehicle Booking End',
                date: returningDate,
                time: returningTime,
                onDateChanged: (date) => setState(() => returningDate = date),
                onTimeChanged: (time) => setState(() => returningTime = time),
              ),
              SizedBox(height: 16),
              // PassengerCountRow(
              //   adultCount: adultCount,
              //   childrenCount: childrenCount,
              //   onAdultIncrement: () => setState(() => adultCount++),
              //   onAdultDecrement: () =>
              //       setState(() => adultCount > 1 ? adultCount-- : null),
              //   onChildrenIncrement: () => setState(() => childrenCount++),
              //   onChildrenDecrement: () =>
              //       setState(() => childrenCount > 0 ? childrenCount-- : null),
              // ),
              SizedBox(height: 16),
              BookingDetailsCard(
                departureDate: departureDate,
                returningDate: returningDate,
                adultCount: adultCount,
                childrenCount: childrenCount,
                baseFlightPrice: baseFlightPrice,
                childPrice: childPrice,
                infantPrice: infantPrice,
                totalPrice: totalPrice,
                callback: onDataFromChild,
                costOfOneRoom: costOfOneRoom,
                onTotalPriceChanged: (double totalPrice) {
                  // Update the totalFlightPrice in the parent widget

                  totalFlightPrice = totalPrice;
                },
              ),
              SizedBox(height: 16),
              CustomElevatedButton(
                  width: 280.h,
                  text: "Continue",
                  margin:
                      EdgeInsets.only(left: 75.h, right: 75.h, bottom: 54.v),
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  onPressed: () {
                    checkBookedDate(context);
                    // onDataFromChild(totalPrice);
                    // _makePayment(totalPrice.toInt());
                    // calculateTotalPrice();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class BookingDetailsCard extends StatefulWidget {
  final DateTime departureDate;
  final DateTime returningDate;
  final int adultCount;
  final int childrenCount;
  final double baseFlightPrice;
  final double childPrice;
  final double infantPrice;
  final double totalPrice;
  final Function(double) callback;
  final double costOfOneRoom;
  final void Function(double) onTotalPriceChanged;
  // Add a unique key parameter
  final Key? cardKey;

  BookingDetailsCard({
    required this.departureDate,
    required this.returningDate,
    required this.adultCount,
    required this.childrenCount,
    required this.baseFlightPrice,
    required this.childPrice,
    required this.infantPrice,
    required this.totalPrice,
    required this.callback,
    required this.onTotalPriceChanged,
    required this.costOfOneRoom,
    // Provide a default key or allow null
    this.cardKey,
  });

  @override
  _BookingDetailsCardState createState() => _BookingDetailsCardState();
}

class _BookingDetailsCardState extends State<BookingDetailsCard> {
  double totalFlightPrice = 0;

  double initialCostOfRoom = 0;
  double percentageCostAdded = 0;
  double percentageCostVat = 0;
  double percentageCostCity = 0;

  @override
  void initState() {
    super.initState();
  }

  // Call the callback function in the parent widget

  void calculateTotalPrice() {
    int numberOfDays =
        widget.returningDate.difference(widget.departureDate).inDays;
    totalFlightPrice = (widget.costOfOneRoom * numberOfDays);
    totalFlightPrice = widget.totalPrice;

    // widget.callback(totalFlightPrice);

    setState(() {
      widget.onTotalPriceChanged(totalFlightPrice);
    });
  }

  double calculateFinalTotal(double numberOfDays) {
    // Multiply the number of days by 30,000
    double initialTotal = numberOfDays * widget.costOfOneRoom;
    initialCostOfRoom = initialTotal;

    // Add 15% of the new total
    double finalTotal = initialTotal + (initialTotal * 0.15);
    double tenpercentCost = initialTotal + (initialTotal * 0.10);
    double fivepercentCost = initialTotal + (initialTotal * 0.05);
    percentageCostVat = fivepercentCost - initialTotal;
    percentageCostCity = tenpercentCost - initialTotal;

    widget.callback(finalTotal);

    return finalTotal;
  }

  @override
  Widget build(BuildContext context) {
    int numberOfDays =
        widget.returningDate.difference(widget.departureDate).inDays;
    int totalTickets = widget.adultCount + widget.childrenCount;
    double totalPrice = (widget.costOfOneRoom * numberOfDays);
    print("$totalPrice is here");
    totalPrice = calculateFinalTotal(numberOfDays.toDouble());
    widget.callback(totalPrice);

    double finalTotal = calculateFinalTotal(numberOfDays.toDouble());

    final NumberFormat currencyFormatter = NumberFormat.currency(symbol: '₦');

    return Card(
      key: widget.cardKey, // Set the key here
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: numberOfDays == 0
            ? Text('Select Booking')
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booking Details',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF006CE3), // Royal Blue
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'booking details below',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  BookingDetailItem(
                      title: 'Number of Days:', value: '$numberOfDays days'),
                  BookingDetailItem(
                    title: 'Vehicle Booking Date',
                    value: DateFormat.yMMMMd().format(widget.departureDate),
                  ),
                  BookingDetailItem(
                    title: 'Vehicle Booking Date',
                    value: DateFormat.yMMMMd().format(widget.returningDate),
                  ),

                  BookingDetailItem(
                    title: 'Base Vehicle Booking Price:',
                    value: currencyFormatter.format(widget.costOfOneRoom),
                  ),
                  BookingDetailItem(
                    title: 'City Tax: 10%:',
                    value: currencyFormatter.format(percentageCostCity),
                  ),
                  BookingDetailItem(
                    title: 'Vat: 5%',
                    value: currencyFormatter.format(percentageCostVat),
                  ),
                  BookingDetailItem(
                    title: 'Total Price:',
                    value: currencyFormatter.format(finalTotal),
                  ),
                  // BookingDetailItem(title: 'Base Vehicle Booking Price:', value: '₦ ${widget.costOfOneRoom}'),
                  // BookingDetailItem(title: 'City Tax: 10%:', value: '₦ ${percentageCostCity}'),
                  // BookingDetailItem(title: 'Vat: 5%', value: '₦ ${percentageCostVat}'),
                  // BookingDetailItem(title: 'Total Price:', value: '₦ ${finalTotal}'),
                  // BookingDetailItem(title: 'Total Tickets:', value: '$totalTickets ticket(s)'),
                ],
              ),
      ),
    );
  }
}

class BookingDetailItem extends StatelessWidget {
  final String title;
  final String value;

  BookingDetailItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    print(value);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFF006CE3), // Royal Blue
            ),
          ),
        ],
      ),
    );
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
                      SizedBox(
                        height: 19,
                      ),
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

class PassengerCountRow extends StatelessWidget {
  final int adultCount;
  final int childrenCount;
  final Function() onAdultIncrement;
  final Function() onAdultDecrement;
  final Function() onChildrenIncrement;
  final Function() onChildrenDecrement;

  PassengerCountRow({
    required this.adultCount,
    required this.childrenCount,
    required this.onAdultIncrement,
    required this.onAdultDecrement,
    required this.onChildrenIncrement,
    required this.onChildrenDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PassengerCountCard(
              title: 'Adults',
              count: adultCount,
              onIncrement: onAdultIncrement,
              onDecrement: onAdultDecrement,
            ),
            PassengerCountCard(
              title: 'Children',
              count: childrenCount,
              onIncrement: onChildrenIncrement,
              onDecrement: onChildrenDecrement,
            ),
          ],
        ),
      ),
    );
  }
}

class PassengerCountCard extends StatelessWidget {
  final String title;
  final int count;
  final Function() onIncrement;
  final Function() onDecrement;

  PassengerCountCard({
    required this.title,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleIconButton(
              icon: Icons.remove,
              onPressed: onDecrement,
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white70,
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006CE3), // Royal Blue
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleIconButton(
              icon: Icons.add,
              onPressed: onIncrement,
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  const CircleIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Color(0xFF003B95), // Royal Blue
      child: IconButton(
        icon: Icon(
          icon,
          size: 18,
        ),
        color: Colors.white,
        onPressed: onPressed,
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
        padding: EdgeInsets.all(24),
        backgroundColor: Color(0xFFFFB700), // Royal Blue
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
          Expanded(
            child: Text(
              '${initialDate.toLocal()}'.split(' ')[0],
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
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
        padding: EdgeInsets.all(24),
        backgroundColor: Color(0xffFFB700), // Royal Blue
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
                            selectedTime = TimeOfDay(
                                hour: value, minute: selectedTime.minute);
                          });
                        },
                      ),
                      _buildTimePicker(
                        context,
                        selectedTime.minute,
                        (value) {
                          setState(() {
                            selectedTime = TimeOfDay(
                                hour: selectedTime.hour, minute: value);
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

  Widget _buildTimePicker(
      BuildContext context, int value, ValueChanged<int> onChanged) {
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
            int newValue =
                (value - 1 + (value == 0 ? 24 : 60)) % (value == 0 ? 24 : 60);
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

class RoundedDropdownButton extends StatelessWidget {
  final String value;
  final List<String> items;
  final void Function(String?) onChanged;

  // Add accessibility label or hint for the dropdown
  final String? accessibilityLabel;

  RoundedDropdownButton({
    required this.value,
    required this.items,
    required this.onChanged,
    this.accessibilityLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
        style: TextStyle(
          color: Color(0xFF006CE3),
          fontSize: 10.0,
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: accessibilityLabel,
            labelStyle: TextStyle(fontSize: 00.0)),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 10.0,
                    color: Color(0xFF006CE3),
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlightBookinggWidget extends StatefulWidget {
  @override
  _FlightBookinggWidgetState createState() => _FlightBookinggWidgetState();
}

class _FlightBookinggWidgetState extends State<FlightBookinggWidget> {
  String bookingFor = '';
  int adultCount = 1;
  int childrenCount = 0;
  DateTime departureDate = DateTime.now();
  TimeOfDay departureTime = TimeOfDay.now();
  DateTime returningDate = DateTime.now();
  TimeOfDay returningTime = TimeOfDay.now();

  double baseFlightPrice = 200.0; // Replace with your actual flight price
  double childPrice = 20.0; // Replace with your actual child price
  double infantPrice = 40.0; // Replace with your actual infant price

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
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
              PassengerCountRow(
                adultCount: adultCount,
                childrenCount: childrenCount,
                onAdultIncrement: () => setState(() => adultCount++),
                onAdultDecrement: () =>
                    setState(() => adultCount > 1 ? adultCount-- : null),
                onChildrenIncrement: () => setState(() => childrenCount++),
                onChildrenDecrement: () =>
                    setState(() => childrenCount > 0 ? childrenCount-- : null),
              ),
              SizedBox(height: 16),
              BookingDetailsCard(
                departureDate: departureDate,
                returningDate: returningDate,
                adultCount: adultCount,
                childrenCount: childrenCount,
                baseFlightPrice: baseFlightPrice,
                childPrice: childPrice,
                infantPrice: infantPrice,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implement booking submission logic here
                  // You can display a confirmation dialog or navigate to a new screen
                  // based on your application flow.
                  // For now, let's print a message to the console.
                  print('Booking submitted!');
                },
                child: Text('Submit Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingDetailsCard extends StatelessWidget {
  final DateTime departureDate;
  final DateTime returningDate;
  final int adultCount;
  final int childrenCount;
  final double baseFlightPrice;
  final double childPrice;
  final double infantPrice;

  BookingDetailsCard({
    required this.departureDate,
    required this.returningDate,
    required this.adultCount,
    required this.childrenCount,
    required this.baseFlightPrice,
    required this.childPrice,
    required this.infantPrice,
  });

  @override
  Widget build(BuildContext context) {
    int numberOfDays = returningDate.difference(departureDate).inDays;
    double totalFlightPrice = (baseFlightPrice * numberOfDays * adultCount) +
        (childPrice * numberOfDays * childrenCount) +
        (infantPrice * numberOfDays * childrenCount);

    int totalTickets = adultCount + childrenCount;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF006CE3), // Royal Blue
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Fill out your booking details below',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            BookingDetailItem(title: 'Number of Days:', value: '$numberOfDays days'),
            BookingDetailItem(title: 'Base Flight Price:', value: '\$$baseFlightPrice'),
            BookingDetailItem(title: 'Total Price:', value: '\$$totalFlightPrice'),
            BookingDetailItem(title: 'Total Tickets:', value: '$totalTickets ticket(s)'),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
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
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
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
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF006CE3), // Royal Blue
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
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
                        'Time:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
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
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  fontSize: 16,
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
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
      backgroundColor: Color(0xFF006CE3), // Royal Blue
      child: IconButton(
        icon: Icon(icon),
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
        padding: EdgeInsets.all(12), backgroundColor: Color(0xFF006CE3), // Royal Blue
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
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
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
        padding: EdgeInsets.all(12), backgroundColor: Color(0xFF006CE3), // Royal Blue
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
              fontSize: 14,
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

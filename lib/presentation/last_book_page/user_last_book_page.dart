import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/presentation/last_book_complete_page/last_book_complete_page.dart';
import 'package:kuddle_s_application27/presentation/last_book_ongoing_page/last_book_ongoing_page.dart';
import 'package:kuddle_s_application27/presentation/last_book_page/last_book_page.dart';

class UserLastBookingPage extends StatefulWidget {
  @override
  _UserLastBookingPageState createState() => _UserLastBookingPageState();
}

class _UserLastBookingPageState extends State<UserLastBookingPage> {
  int selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    const double chipSpacing = 6.0;
    List<String> chipNames = ["Accommodation", "Cars", "Flights", "Tours", "Services"];

    return Scaffold(
      appBar: AppBar(
        title: Text('User Last Booking'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 15.h),
        child: IntrinsicWidth(
          child: Column(
            children: [

              Row(
                children: List<Widget>.generate(
                  5,
                      (index) => Padding(
                    padding: EdgeInsets.only(right: chipSpacing),
                    child: RawChip(
                      padding: EdgeInsets.symmetric(
                        horizontal: 19.h,
                        vertical: 10.v,
                      ),
                      showCheckmark: false,
                      labelPadding: EdgeInsets.zero,
                      label: Text(
                        chipNames[index], // Use the chip name from the list
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 14.fSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      selected: selectedChipIndex == index,
                      backgroundColor: theme.colorScheme.onPrimaryContainer,
                      // Set the selected color to blue when the chip is selected
                      selectedColor: Colors.blue, // Change this to your desired color
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(18.h),
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedChipIndex = value ? index : -1;
                          _buildContentBasedOnSelectedWidget();
                        });

                        // You can add any logic here that you want to execute when the chip is selected or unselected
                      },
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 1000,
                  child: _buildContentBasedOnSelectedWidget()),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildContentBasedOnSelectedWidget() {
    switch (selectedChipIndex) {
      case 0:
        return _buildVariation1();
      case 1:
        return _buildVariation2();
      case 2:
        return _buildVariation3();
      case 3:
        return _buildVariation4();
      case 4:
        return _buildVariation5();
      default:
        return Container(); // Placeholder, change as per your requirement
    }
  }



  Widget _buildVariation1() {
    return LastBookPage();
  }

  Widget _buildVariation2() {
    // Implement variation 2 content here
    // Example:
    return LastBookOngoingPage();
  }

// Implement _buildVariation3, _buildVariation4, _buildVariation5 similarly

// Example for variation 3:
  Widget _buildVariation3() {
    return LastBookCompletePage();
  }

// Example for variation 4:
  Widget _buildVariation4() {
    return Padding(
      padding: EdgeInsets.only(left: 15.h),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LastBookPage()

          ]),
    );
  }

// Example for variation 5:
  Widget _buildVariation5() {
    return Padding(
      padding: EdgeInsets.only(left: 15.h),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildPopularHotelsSection5(context),
            // SizedBox(height: 27.v),
            // _buildHomeSection5(context),
            // SizedBox(height: 40.v),
            // Text("Other Services",
            //     style: CustomTextStyles.titleLarge23),
            // SizedBox(height: 29.v),
            // _buildHotDealsSection5(context)
          ]),
    );
  }

}



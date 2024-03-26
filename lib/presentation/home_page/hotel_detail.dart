import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/pages/home/model/property_list_model/property_model.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_screen/book_room_calendar_screen.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_screen/book_room_calendar_screen_original.dart';
import 'package:kuddle_s_application27/presentation/book_room_calendar_screen/build_booking_hotel.dart';
import 'package:kuddle_s_application27/presentation/home_page/home_page.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:kuddle_s_application27/widgets/custom_icon_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/favourites.dart';
import '../../models/rooms.dart';
import '../../services/provider/provider_services.dart';
import '../book_room_calendar_screen/BookingRoom.dart';
import '../favorite_page/favourite_tab.dart';

class HotelDetail extends StatefulWidget {
  final PropertyModel property;
  HotelDetail({Key? key, required this.property}) : super(key: key);

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  ProviderServices? providerServices;
  int? selectedRoomIDNow;
  String? price;
  String? roomPrice;
  String? roomType;
  String? roomNo;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // Assuming currencyFormat is an instance of NumberFormat
  NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'en_NG', symbol: '\₦');

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(bottom: 5.v),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSeventyFour(context),
                  Container(
                    margin:
                        EdgeInsets.only(bottom: 0), // Adjust margin as needed
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 24.v),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("${widget.property.propertyId}", style: theme.textTheme.headlineMedium),
                        Text("${widget.property.propertyName}",
                            style: theme.textTheme.headlineMedium),
                        SizedBox(height: 8.v),
                        _buildVector(context),
                        SizedBox(height: 27.v),
                        Divider(color: appTheme.gray400.withOpacity(0.7)),
                        SizedBox(height: 22.v),
                        Text("Details", style: theme.textTheme.titleMedium),
                        SizedBox(height: 27.v),
                        Container(
                          width: 385.h,
                          margin: EdgeInsets.only(right: 14.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                // TextSpan(
                                //   text: "${widget.property.propertyName} ",
                                //   style: CustomTextStyles.bodySmallGray500,
                                // ),
                                TextSpan(
                                  text: "${widget.property.aboutProperty}",
                                  style: CustomTextStyles.bodySmallPrimary,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 23.v),
                        Text("Facilities", style: theme.textTheme.titleMedium),
                        SizedBox(height: 32.v),
                        _buildSwimmingPool(context),
                        SizedBox(height: 27.v),
                        _buildLaundry(context),
                        SizedBox(height: 27.v), // Add space between sections
                        _buildAdditionalDetails(context),
                        SizedBox(height: 27.v),
                        _buildRoomList(context),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  10), // Add padding for a better visual
                          child: Text(
                            roomType == null ? '' : 'Room Type: $roomType',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors
                                  .blueAccent, // Set the text color to white for better visibility on a blue background
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign
                                .center, // Align the text to the center
                          ),
                        ),
                        SizedBox(height: 27.v),

                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  10), // Add padding for a better visual
                          child: Text(
                            roomNo == null ? '' : 'Room No: $roomNo',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors
                                  .blue, // Set the text color to white for better visibility on a blue background
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign
                                .center, // Align the text to the center
                          ),
                        ),
                        SizedBox(height: 27.v),

                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  10), // Add padding for a better visual
                          child: Text(
                            roomPrice == null
                                ? ''
                                : 'price: ₦${formatPrice(roomPrice)}/night',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors
                                  .blue, // Set the text color to white for better visibility on a blue background
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign
                                .center, // Align the text to the center
                          ),
                        ),

                        SizedBox(height: 100.v),
                        selectedRoomIDNow == null
                            ? Text('')
                            : _buildBookNow(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String formatPrice(String? price) {
    if (price == null || price.isEmpty) {
      return '0';
    }

    try {
      return NumberFormat('#,##0').format(int.parse(price));
    } catch (e) {
      // Handle the parsing error gracefully
      print("Error parsing price: $e");
      return '0';
    }
  }

  Widget _buildAdditionalDetails(BuildContext context) {
    String? priceString =
        widget.property.price != null && widget.property.price!.isNotEmpty
            ? widget.property.price
            : '0.0';

    // Convert the String to a double using double.parse
    double price = double.parse(priceString!);

    // Create a NumberFormat instance for currency formatting
    NumberFormat currencyFormatter = NumberFormat.currency(symbol: '₦');

    // Format the currency string
    String formattedCurrency = currencyFormatter.format(price);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Text("Additional Details",
              style: theme.textTheme.headline6
                  ?.copyWith(color: Color(0xFF003B95))),
        ),
        SizedBox(height: 8.v), // Reduced spacing
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem(
                  Icons.access_time, "Check In", "From 07:44 AM to 1:44 PM"),
              _buildDetailItem(
                  Icons.access_time, "Check Out", "From 12:00 PM to 3:00 PM"),
            ],
          ),
        ),
        SizedBox(height: 8.v),

        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem(Icons.policy, "Cancellation/prepayment",
                  "Cancellation and prepayment policies vary according to accommodations type."),
            ],
          ),
        ), // Red

        SizedBox(height: 8.v), // Reduced spacing
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem(Icons.child_care, "Children & Beds",
                  "Children are not allowed in this property. No age restriction. There's no age requirement for check-in."),
            ],
          ),
        ),

        SizedBox(height: 8.v), // Reduced spacing
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem(Icons.pets, "Pets", "Pets are not allowed."),
              _buildDetailItem(
                  Icons.smoking_rooms, "Smoking", "Smoking is not allowed."),
            ],
          ),
        ),
        SizedBox(height: 8.v), // Reduced spacing
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem(Icons.payment, "Accepted payment methods",
                  "Cash is not accepted. Pay securely through your e-wallet."),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem(
    IconData icon,
    String title,
    String content,
  ) {
    // Calculate the fraction of ListTile width for the icon
    double iconFraction = 0.1; // Adjust the fraction for the desired size

    // Calculate the icon size based on the fraction of ListTile width
    double iconSize = mediaQueryData.size.width * iconFraction;

    return Flexible(
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
          leading: Container(
            width: iconSize,
            height: iconSize,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,
                    color: Colors.white,
                    size: 16.0), // Adjust the size for the desired icon size
              ],
            ),
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              color: Color(0xFF003B95),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          title: Text(
            title,
            style:
                theme.textTheme.subtitle1?.copyWith(color: Color(0xFF003B95)),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 8.v),
            child: Text(
              content,
              style:
                  theme.textTheme.bodyText2?.copyWith(color: Color(0xFF003B95)),
            ),
          ),
        ),
      ),
    );
  }

  int _currentIndex = 0;

  Widget _buildSeventyFour(BuildContext context) {
    final List<String> imageUrls = [
      '${widget.property.propertyPic1}',
      '${widget.property.propertyPic2}',
      '${widget.property.propertyPic3}',
      // Add other image URLs as needed
    ];

    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: imageUrls.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return CustomImageView(
                    imagePath: imageUrls[index],
                    height: 311.v,
                    width: 430.h,
                    radius: BorderRadius.circular(15.h),
                    alignment: Alignment.center,
                  );
                },
                options: CarouselOptions(
                  height: 311.v,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                ),
              ),
              Positioned(
                top: 20.0,
                left: 16.0,
                child: GestureDetector(
                  onTap: () {
                    // Handle back button tap
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowLeft,
                    height: 31.adaptSize,
                    width: 31.adaptSize,
                    margin: EdgeInsets.only(bottom: 186.v),
                    onTap: () {
                      onTapImgArrowLeft(context);
                    },
                  ),
                ),
              ),
              Positioned(
                top: 20.0,
                right: 16.0,
                child: GestureDetector(
                  onTap: () {
                    addFavoriteAndShowList(
                        widget.property.roomId.toString(),
                        widget.property.propertyName.toString(),
                        widget.property.propertyPic1.toString(),
                        widget.property.price.toString());
                  },
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    imageUrls.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: _currentIndex == index ? 33.0 : 5.0,
                        height: _currentIndex == index ? 5.0 : 10.0,
                        child: _currentIndex == index
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff003B95),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              )
                            : Container(
                                width: 30.0,
                                height: 5.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildVector(BuildContext context) {
    String? priceString =
        widget.property.price != null && widget.property.price!.isNotEmpty
            ? widget.property.price
            : '0.0';

    // Convert the String to a double using double.parse
    double price = double.parse(priceString!);

    // Create a NumberFormat instance for currency formatting
    NumberFormat currencyFormatter = NumberFormat.currency(symbol: '₦');

    // Format the currency string
    String formattedCurrency = currencyFormatter.format(price);

    return SizedBox(
        height: 55.v,
        width: 400.h,
        child: Stack(alignment: Alignment.topRight, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorPrimary,
                          height: 15.v,
                          width: 10.h,
                          margin: EdgeInsets.only(bottom: 2.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 8.h),
                          child: Text("${widget.property.stateProvince}",
                              style: CustomTextStyles.bodyMediumRegular))
                    ]),
                    SizedBox(height: 13.v),
                    Row(children: [
                      Text("Review", style: theme.textTheme.titleSmall),
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorPrimarycontainer,
                          height: 11.adaptSize,
                          width: 11.adaptSize,
                          margin: EdgeInsets.only(
                              left: 10.h, top: 2.v, bottom: 3.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "4.9 ",
                                    style: CustomTextStyles.bodySmallPrimary),
                                TextSpan(
                                    text: "(10k review)",
                                    style: CustomTextStyles.bodySmallGray400)
                              ]),
                              textAlign: TextAlign.left)),
                      Spacer(),
                      Text("See All",
                          style: CustomTextStyles.bodySmallPrimary_1)
                    ])
                  ])),
          Align(
            alignment: Alignment.topRight,
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: " ${widget.property.country}",
                      style: theme.textTheme.titleSmall),
                ]),
                textAlign: TextAlign.left),
          )
        ]));
  }

  /// Section Widget
  Widget _buildSwimmingPool(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 3.h, right: 23.h),
        child: Row(children: [
          Column(children: [
            CustomImageView(
                imagePath: ImageConstant.imgGroup, height: 30.v, width: 38.h),
            SizedBox(height: 11.v),
            Text("Swimming Pool", style: CustomTextStyles.labelMediumPrimary)
          ]),
          Spacer(flex: 28),
          Column(children: [
            CustomImageView(
                imagePath: ImageConstant.imgGroupPrimary,
                height: 30.v,
                width: 36.h),
            SizedBox(height: 9.v),
            Text("Wifi", style: CustomTextStyles.labelMediumPrimary)
          ]),
          Spacer(flex: 36),
          Column(children: [
            CustomImageView(
                imagePath: ImageConstant.imgGroupPrimary30x30,
                height: 30.adaptSize,
                width: 30.adaptSize),
            SizedBox(height: 10.v),
            Text("Restaurant", style: CustomTextStyles.labelMediumPrimary)
          ]),
          Spacer(flex: 35),
          Column(children: [
            CustomImageView(
                imagePath: ImageConstant.imgFlag, height: 30.v, width: 27.h),
            SizedBox(height: 11.v),
            Text("Parking", style: CustomTextStyles.labelMediumPrimary)
          ])
        ]));
  }

  /// Section Widget
  Widget _buildLaundry(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 11.v),
                      child: Column(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgGroupPrimary30x26,
                            height: 30.v,
                            width: 26.h),
                        SizedBox(height: 11.v),
                        Text("Laundry",
                            style: CustomTextStyles.labelMediumPrimary)
                      ])),
                  Column(children: [
                    SizedBox(
                        height: 30.v,
                        width: 31.h,
                        child: Stack(alignment: Alignment.topLeft, children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgGroup159,
                              height: 30.v,
                              width: 31.h,
                              alignment: Alignment.center),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  height: 1.adaptSize,
                                  width: 1.adaptSize,
                                  margin: EdgeInsets.only(left: 14.h, top: 4.v),
                                  decoration: BoxDecoration(
                                      color: theme.colorScheme.primary)))
                        ])),
                    SizedBox(height: 9.v),
                    SizedBox(
                        width: 62.h,
                        child: Text("Conference\nRoom",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.labelMediumPrimary))
                  ]),
                  Padding(
                      padding: EdgeInsets.only(bottom: 11.v),
                      child: Column(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgFlagPrimary,
                            height: 30.v,
                            width: 48.h),
                        SizedBox(height: 11.v),
                        Text("Gym", style: CustomTextStyles.labelMediumPrimary)
                      ])),
                  Column(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgGroup30x30,
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 6.h)),
                    SizedBox(height: 10.v),
                    SizedBox(
                        width: 47.h,
                        child: Text("Wellness \nCenter",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.labelMediumPrimary))
                  ])
                ])));
  }

  /// Section Widget
  Widget _buildLocation(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Location", style: theme.textTheme.titleMedium),
                  SizedBox(height: 25.v),
                  Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder20),
                      child: Container(
                          height: 234.v,
                          width: 400.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusStyle.roundedBorder20),
                          child: Stack(alignment: Alignment.center, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgBasemapImage,
                                height: 234.v,
                                width: 400.h,
                                radius: BorderRadius.circular(20.h),
                                alignment: Alignment.center),
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgDefaultMarkerComponent,
                                height: 5.v,
                                width: 4.h,
                                radius: BorderRadius.circular(2.h),
                                alignment: Alignment.center)
                          ])))
                ])));
  }

  /// Section Widget
  Widget _buildBookNow(BuildContext context) {
    return CustomElevatedButton(
        width: 278.h,
        text: "Book Now",
        margin: EdgeInsets.only(left: 76.h, right: 76.h, bottom: 29.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        onPressed: () {
          // BookRoomCalendarScreenOriginal(property: widget.property)
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HotelBookingWidget(
                    vehicle: widget.property,
                    itemID: selectedRoomIDNow.toString())),
          );
        });
  }

  Widget _buildRoomList(BuildContext context) {
    int? selectedRoomID; // Variable to store the selected room ID

    return Consumer<ProviderServices>(
      builder: (_, provider, __) {
        // Check if provider or bookRoomListModel is null before accessing data
        if (provider.roomModel?.rooms == null) {
          return Center(child: const CircularProgressIndicator());
        }

        List<Room>? items = provider.roomModel?.rooms;

        if (items == null || items.isEmpty) {
          return Center(
            child: Text(
              'Rooms are unavailable at the moment',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<int>(
                value: selectedRoomID,
                hint: Text('Select a Room'),
                onChanged: (newSelectedRoomID) {
                  // Update the selected room ID when user makes a selection
                  setState(() {
                    selectedRoomID = newSelectedRoomID;
                    selectedRoomIDNow = newSelectedRoomID;
                  });

                  String selectedRoomType =
                      getRoomType(selectedRoomID!, provider.roomModel?.rooms);
                  String selectedRoomNo =
                      getRoomNumber(selectedRoomID!, provider.roomModel?.rooms);
                  String price =
                      getRoomPrice(selectedRoomID!, provider.roomModel?.rooms);
                  // Update the global variable roomType
                  setState(() {
                    roomType = selectedRoomType;
                    roomNo = selectedRoomNo;
                    roomPrice = price;
                  });

                  // Display a toast message using Fluttertoast
                  Fluttertoast.showToast(
                    msg: 'Selected Room Type: $selectedRoomType',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.yellow,
                    fontSize: 16.0,
                  );
                  // Handle room selection here
                  print('Selected Room ID: $selectedRoomID');
                  // Print the room type for debugging
                  print(
                      'Room Type: ${getRoomType(selectedRoomID!, provider.roomModel?.rooms)}');
                  print('Room Type: ${selectedRoomIDNow}');
                },
                items: provider.roomModel?.rooms
                    .map<DropdownMenuItem<int>>((room) {
                  return DropdownMenuItem<int>(
                    value: room.roomID,
                    child: Text(room.roomNo.toString() + ': ' + room.roomType),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.v),
              // Display the selected room information
              selectedRoomID != null
                  ? Text(
                      'Selected Room Type: ${selectedRoomIDNow}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Container(), // You can customize this part based on your UI requirements
            ],
          ),
        );
      },
    );
  }

  String getRoomType(int selectedRoomID, List<Room>? rooms) {
    // Find the room with the selected ID
    Room? selectedRoom = rooms?.firstWhere(
      (room) => room.roomID == selectedRoomID,
      orElse: () => null as Room,
    );

    // Return the room type if found, otherwise 'Unknown'
    return selectedRoom?.roomType ?? 'Unknown';
  }

  String getRoomNumber(int selectedRoomID, List<Room>? rooms) {
    // Find the room with the selected ID
    Room? selectedRoom = rooms?.firstWhere(
      (room) => room.roomID == selectedRoomID,
      orElse: () => null as Room,
    );

    // Return the room type if found, otherwise 'Unknown'
    return selectedRoom?.roomNo.toString() ?? 'Unknown';
  }

  String getRoomPrice(int selectedRoomID, List<Room>? rooms) {
    // Find the room with the selected ID
    Room? selectedRoom = rooms?.firstWhere(
      (room) => room.roomID == selectedRoomID,
      orElse: () => null as Room,
    );

    // Return the room type if found, otherwise 'Unknown'
    return selectedRoom?.price.toString() ?? 'Unknown';
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    // Navigate back and await the result

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(selectedIndex: 0),
      ),
    );
    // Navigator.pop(context);
  }

  /// Navigates to the bookRoomCalendarScreen when the action is triggered.
  onTapBookNow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.bookRoomCalendarScreen);
  }

  Future<void> clearHive() async {
    try {
      var favoritesBox = await Hive.openBox<Favorite>('favoritesBox');
      await favoritesBox.clear();
      print('Hive box cleared successfully!');
    } catch (e) {
      print('Error clearing Hive box: $e');
    }
  }

  Future<void> addFavorite(
      String favoriteName, String name, String image, String price) async {
    try {
      print('adding now');

      var favoritesBox = await Hive.openBox<Favorite>('favoritesBox');

      // Check if an item with the same ID already exists
      if (favoritesBox.values.any((fav) => fav.id == favoriteName)) {
        Fluttertoast.showToast(
          msg: '$name is already one of your favourites!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.yellow,
          fontSize: 16.0,
        );
        print('Favorite with ID $favoriteName already exists.');
        return; // Do not add a duplicate, exit the method
      }

      var newFavorite = Favorite(
        id: favoriteName,
        name: name,
        image: image,
        price: double.parse(price),
      );

      await favoritesBox.add(newFavorite);

      Fluttertoast.showToast(
        msg: 'Favorite added successfully!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.yellow,
        fontSize: 16.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error adding favorite: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<bool> isFavorite(String roomId) async {
    var favoritesBox = await Hive.openBox<Favorite>('favoritesBox');

    // Check if an item with the same ID already exists
    if (favoritesBox.values.any((fav) => fav.id == roomId)) {
      print('Favorite with ID $roomId already exists.');
      return true; // The item with the specified ID is a favorite
    } else {
      return false; // The item with the specified ID is not a favorite
    }
  }

  Future<void> addFavoriteAndShowList(
      String favoriteName, String name, String image, String price) async {
    await addFavorite(favoriteName, name, image, price);
    await initializeFavorites(); // This will print the updated list
    initializeFavorites();
  }

  Future<void> initializeFavorites() async {
    try {
      var favoritesList = await getFavoritesList();
      print('Favorites List: $favoritesList');
    } catch (e) {
      print('Error getting favorites list: $e');
    }
  }

  Future<List<Favorite>> getFavoritesList() async {
    var favoritesBox = await Hive.openBox<Favorite>('favoritesBox');
    return favoritesBox.values.toList();
  }
}

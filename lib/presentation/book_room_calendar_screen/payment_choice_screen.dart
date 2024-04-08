import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_trailing_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

import '../../main_core/session_manager.dart';
import '../../services/provider/provider_services.dart';
import '../payment_sucess_screen/payment_sucess_screen.dart';

class PaymentChoiceScreen extends StatefulWidget {
  final double finalPaymentMode;
  final String itemType;
  final String id;
  final String price;
  final List<String>? bookedDates;
  final String? checkInDate;
  final String? checkInTime;
  final String? checkOutDate;
  final String? checkOutTime;
  final String? hostID;
  final String? roomID;
  final String? numberOfDays;
  final String? numberOfTickets;
  final String? itemID;

  const PaymentChoiceScreen({Key? key,
    required this.finalPaymentMode,
    required this.itemType,required this.id,
   this.checkInDate,
   this.checkInTime,
   this.checkOutDate,
   this.checkOutTime,
    this.hostID,
    this.roomID,
    this.itemID,
    this.numberOfTickets,
    this.numberOfDays,
    required this.price, this.bookedDates}) : super(key: key);

  @override
  _PaymentChoiceScreenState createState() => _PaymentChoiceScreenState();
}

class _PaymentChoiceScreenState extends State<PaymentChoiceScreen> {
  String selectedPaymentMethod = '';



  void addOrder(context) async {
    var userId = await getAuthUserID();
    DateTime now = DateTime.now();
    String formattedDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    String formattedTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    providerServices?.addOrder(
        map: {
          "amountPaid":finalTotalMade.toString(),
          "bookingFor": widget.itemType.toString(),
          "checkInDate":widget.checkInDate.toString(),
          "checkInTime": widget.checkInTime.toString(),
          "checkOutDate":widget.checkOutDate.toString(),
          "checkOutTime":widget.checkOutTime.toString(),
          "duration":widget.numberOfDays.toString(),
          "hostID":widget.hostID.toString(),
          "itemID": widget.itemID?.toString() ?? widget.id?.toString() ?? '1',
          "itemType":widget.itemType.toString(),
          "itemUnitPrice":widget.price.toString(),
          "tickets": widget.numberOfTickets?.toString() ?? 0.toString() ?? '1',
          "userID":"$userId",
          "bookedDates": widget.bookedDates,
          "roomID": widget.id.toString(),
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

  ProviderServices? providerServices;

  double finalTotalMade = 0;

  final payStackClient = PaystackPlugin();

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


finalTotalMade = widget.finalPaymentMode;

    double price = finalTotalMade ?? 0.0;

    final Charge charge = Charge()
      ..amount = (widget.finalPaymentMode * 100).round()
      ..email = 'poco@gmail.com'
      ..reference = reference;

    final CheckoutResponse response = await payStackClient.checkout(context,
        charge: charge, method: CheckoutMethod.card);

    print('object....${response.toString}');

    if (response.status && response.reference == reference) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);

      addOrder(context);
      // payWithWallet(context);
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

  void payWithWallet(context) async {

    // setState(() {});
    var userId = await getAuthUserID();

    providerServices?.userPayWithWallet(
        map: {
          "amount": widget.finalPaymentMode.toString(),
        },
        context: context);

    addOrder(context);

    Navigator.push(
      context!,
      MaterialPageRoute(
        builder: (context) => const PaymentSucessScreen(),
      ),
    );

  }

  getAuthUserID() async {
    String? userID = SessionManager.instance.authUserID;
    return userID;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    _startPaystack();
    // nameController.addListener(_updateFinalTotalMade);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 24.v),
          child: Column(
            children: [
              _buildPaymentMethod(context),
              SizedBox(height: 35.v),
              _buildPaypalOne(context),
              SizedBox(height: 22.v),
              _buildGoogle(context),
              SizedBox(height: 22.v),
              // _buildVector(context),
              SizedBox(height: 29.v),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: GestureDetector(
              //     onTap: () {
              //       onTapTxtAddNewCard(context);
              //     },
              //     child: Padding(
              //       padding: EdgeInsets.only(right: 1.h),
              //       child: Text(
              //         "Add New Card ",
              //         style: CustomTextStyles.labelLargeBlue700,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 91.v),
              CustomElevatedButton(
                width: 267.h,
                text: "Pay Now",
                buttonStyle: CustomButtonStyles.fillPrimary,
                onPressed: () {
                  if ( selectedPaymentMethod == 'Paypal'){
                    _makePayment(widget.finalPaymentMode.toInt());
                  }else{

                   payWithWallet(context);
                  }


                  // onTapPayNow(context);
                },
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftPrimary,
        margin: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 12.v),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      title: AppbarTitle(text: "Payment", margin: EdgeInsets.only(left: 14.h)),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgQrCodeScanner,
          margin: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 15.v),
        ),
      ],
    );
  }

  Widget _buildPaymentMethod(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Payment Method", style: CustomTextStyles.titleSmall15_1),
          GestureDetector(
            onTap: () {
              onTapTxtViewBalance(context);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text(
                "view balance",
                style: CustomTextStyles.labelLargeBlue700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ... (previous code)

  Widget _buildPaypalOne(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handlePaymentMethodSelection('Paypal');
      },
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 13.v),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder7,
          border: Border.all(
            color: selectedPaymentMethod == 'Paypal'
                ? theme.colorScheme.primary
                : Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgMastercard,
              height: 30.adaptSize,
              width: 30.adaptSize,
              margin: EdgeInsets.only(top: 1.v),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.h, top: 7.v, bottom: 4.v),
              child: Text(
                "Card Payment",
                style: CustomTextStyles.titleSmallBold15,
              ),
            ),
            Spacer(),
            if (selectedPaymentMethod == 'Paypal')
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.v),
                padding: EdgeInsets.all(1.h),
                decoration: AppDecoration.fillPrimary1.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder7,
                ),
                child: Container(
                  height: 10.adaptSize,
                  width: 10.adaptSize,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.h),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoogle(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handlePaymentMethodSelection('Google Pay');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 13.v),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder7,
          border: Border.all(
            color: selectedPaymentMethod == 'Google Pay'
                ? theme.colorScheme.primary
                : Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgIconWallet,
              height: 30.adaptSize,
              width: 30.adaptSize,
              margin: EdgeInsets.only(top: 1.v),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.h, top: 7.v, bottom: 4.v),
              child: Text(
                "Wallet",
                style: CustomTextStyles.titleSmallBold15,
              ),
            ),
            Spacer(),
            if (selectedPaymentMethod == 'Google Pay')
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.v),
                padding: EdgeInsets.all(1.h),
                decoration: AppDecoration.fillPrimary1.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder7,
                ),
                child: Container(
                  height: 10.adaptSize,
                  width: 10.adaptSize,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.h),
                  ),
                ),
              ),

            // Text('${widget.hostID}'),
            // CustomImageView(
            //   imagePath: ImageConstant.imgGroup215,
            //   height: 14.adaptSize,
            //   width: 14.adaptSize,
            //   margin: EdgeInsets.only(top: 9.v, right: 1.h, bottom: 8.v),
            // ),
          ],
        ),
      ),
    );
  }
  Widget _buildVector(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 13.v),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgVector,
            height: 30.v,
            width: 25.h,
            margin: EdgeInsets.only(top: 1.v),
          ),
          Padding(
            padding: EdgeInsets.only(left: 19.h, top: 7.v, bottom: 4.v),
            child: Text(
              "Apple Pay",
              style: CustomTextStyles.titleSmallBold15,
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgGroup215,
            height: 14.adaptSize,
            width: 14.adaptSize,
            margin: EdgeInsets.only(top: 9.v, bottom: 8.v),
          ),
        ],
      ),
    );
  }

  void handlePaymentMethodSelection(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  onTapTxtViewBalance(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addPaymentCardScreen);
  }

  onTapTxtAddNewCard(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addPaymentCardScreen);
  }

  onTapPayNow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.bookRoomDetailsScreen);
  }
}

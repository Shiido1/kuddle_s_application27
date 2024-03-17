import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_elevated_button.dart';
import 'package:kuddle_s_application27/widgets/custom_text_form_field.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:provider/provider.dart';

import '../../main_core/session_manager.dart';
import '../../services/provider/provider_services.dart';
import '../payment_sucess_screen/payment_sucess_screen.dart';

// ignore_for_file: must_be_immutable
class AddFundsScreen extends StatefulWidget {
  AddFundsScreen({Key? key}) : super(key: key);

  @override
  State<AddFundsScreen> createState() => _AddFundsScreenState();
}

class _AddFundsScreenState extends State<AddFundsScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController expirydateController = TextEditingController();

  TextEditingController cvvController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

    nameController.text = finalTotalMade.toString();


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
      fundWallet(context);
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

  void fundWallet(context) async {

    // setState(() {});
    var userId = await getAuthUserID();

    providerServices?.userFundWallet(
        map: {
          "amount": nameController.text.trim().toString(),
        },
        context: context);
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
    nameController.addListener(_updateFinalTotalMade);
  }


  void _updateFinalTotalMade() {
    // Parse the value from nameController to a double
    finalTotalMade = double.tryParse(nameController.text) ?? 0.0;
    setState(() {}); // Trigger a rebuild to reflect the changes
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                    EdgeInsets.symmetric(horizontal: 15.h, vertical: 19.v),
                    child: Column(


                        children: [
                      // _buildCartGeometric(context),
                          SizedBox(height: 17.v),
                      // SizedBox(height: 57.v),
                          // Text('Enter amount', style: TextStyle(fontWeight: FontWeight.bold),),
                      _buildName(context),
                      SizedBox(height: 20.v),
                      // _buildCardNumber(context),
                      // SizedBox(height: 20.v),
                      // _buildExpirydate1(context),
                      // SizedBox(height: 77.v),
                      _buildAddCard(context),
                      SizedBox(height: 5.v)
                    ])))));
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
        title:
        AppbarTitle(text: "Add funds to Wallet", margin: EdgeInsets.only(left: 10.h)));
  }

  /// Section Widget
  Widget _buildCartGeometric(BuildContext context) {
    return OutlineGradientButton(
        padding: EdgeInsets.only(left: 2.h, top: 2.v, right: 2.h, bottom: 2.v),
        strokeWidth: 2.h,
        gradient: LinearGradient(
            begin: Alignment(0, 0.43),
            end: Alignment(1, 0.5),
            colors: [theme.colorScheme.onPrimary, appTheme.gray505e]),
        corners: Corners(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        child: Container(
            decoration: AppDecoration.outline
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 18.v),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgMask),
                        fit: BoxFit.cover)),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 3.v),
                      Padding(
                          padding: EdgeInsets.only(left: 2.h, right: 7.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                    opacity: 0.7,
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgChip,
                                        height: 26.v,
                                        width: 35.h,
                                        margin: EdgeInsets.only(top: 5.v))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgLogo,
                                    height: 27.v,
                                    width: 22.h,
                                    margin: EdgeInsets.only(bottom: 4.v))
                              ])),
                      SizedBox(height: 89.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("3455 4562 7710 3507",
                              style: CustomTextStyles.titleLargeOnPrimary)),
                      SizedBox(height: 14.v),
                      Divider(
                          color: appTheme.gray50.withOpacity(0.21),
                          indent: 2.h,
                          endIndent: 5.h),
                      SizedBox(height: 7.v),
                      Container(
                          margin: EdgeInsets.only(left: 2.h, right: 5.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusStyle.roundedBorder7),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    decoration: AppDecoration.outlineGrayF,
                                    child: Text("John Carter",
                                        style: CustomTextStyles
                                            .titleSmallOnPrimary_1)),
                                Container(
                                    decoration: AppDecoration.outlineGrayF,
                                    child: Text("02/30",
                                        style: CustomTextStyles
                                            .titleSmallOnPrimary_1))
                              ]))
                    ]))));
  }

  Widget _buildName(BuildContext context) {
    return CustomTextFormField(

        controller: nameController,
        hintText: "Enter Amount",
        hintStyle: TextStyle(color: Colors.blue),
        contentPadding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 15.v),
        borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8,
        textStyle: TextStyle(color: Colors.blue),
        fillColor: theme.colorScheme.primary.withOpacity(0.1)
    );
  }

  /// Section Widget
  // Widget _buildName(BuildContext context) {
  //   return CustomTextFormField(
  //       controller: nameController,
  //       hintText: "Enter Amount",
  //       hintStyle: CustomTextStyles.bodyMediumRegular,
  //       contentPadding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 15.v),
  //       borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8,
  //       fillColor: theme.colorScheme.primary.withOpacity(0.1));
  // }

  /// Section Widget
  Widget _buildCardNumber(BuildContext context) {
    return CustomTextFormField(
        controller: cardNumberController,
        hintText: "Card Number",
        hintStyle: CustomTextStyles.bodyMediumRegular,
        textInputType: TextInputType.number,
        contentPadding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 15.v),
        borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8,
        fillColor: theme.colorScheme.primary.withOpacity(0.1));
  }

  /// Section Widget
  Widget _buildExpirydate(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 12.h),
            child: CustomTextFormField(
                controller: expirydateController,
                hintText: "Expiry date",
                hintStyle: CustomTextStyles.bodyMediumRegular,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 19.h, vertical: 15.v),
                borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8,
                fillColor: theme.colorScheme.primary.withOpacity(0.1))));
  }

  /// Section Widget
  Widget _buildCvv(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: CustomTextFormField(
                controller: cvvController,
                hintText: "CVV Number",
                hintStyle: CustomTextStyles.bodyMediumRegular,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 19.h, vertical: 15.v),
                borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8,
                fillColor: theme.colorScheme.primary.withOpacity(0.1))));
  }

  /// Section Widget
  Widget _buildExpirydate1(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildExpirydate(context), _buildCvv(context)]);
  }

  /// Section Widget
  Widget _buildAddCard(BuildContext context) {
    return CustomElevatedButton(
        width: 273.h,
        text: "Add Funds",
        buttonStyle: CustomButtonStyles.fillPrimary,
        onPressed: () {
          _makePayment(finalTotalMade.toInt());
          // fundWallet(context);
          // onTapAddCard(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the paymentOptionScreen when the action is triggered.
  onTapAddCard(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.paymentOptionScreen);
  }
}

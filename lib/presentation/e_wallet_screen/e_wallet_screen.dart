import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';
import 'package:kuddle_s_application27/pages/bookings/model/transaction_data_model.dart';
import 'package:kuddle_s_application27/presentation/car_page/car_page.dart';
import 'package:kuddle_s_application27/presentation/e_wallet_screen/add_fund.dart';
import 'package:kuddle_s_application27/presentation/e_wallet_screen/transaction_list_screen.dart';
import 'package:kuddle_s_application27/presentation/favorite_page/favorite_page.dart';
import 'package:kuddle_s_application27/presentation/last_book_tab_container_page/last_book_tab_container_page.dart';
import 'package:kuddle_s_application27/presentation/profile_one_page/profile_one_page.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_leading_image.dart';
import 'package:kuddle_s_application27/widgets/app_bar/appbar_title.dart';
import 'package:kuddle_s_application27/widgets/app_bar/custom_app_bar.dart';
import 'package:kuddle_s_application27/widgets/custom_bottom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../main_core/session_manager.dart';
import '../../pages/bookings/model/user_detail_model.dart';
import '../../pages/bookings/model/wallet_data_model.dart';
import '../../services/provider/provider_services.dart';

// ignore_for_file: must_be_immutable
class EWalletScreen extends StatefulWidget {
 EWalletScreen({Key? key}) : super(key: key);

  @override
  State<EWalletScreen> createState() => _EWalletScreenState();
}

class _EWalletScreenState extends State<EWalletScreen> {
 GlobalKey<NavigatorState> navigatorKey = GlobalKey();


 ProviderServices? providerServices;
 @override
 void initState() {
  providerServices = Provider.of<ProviderServices>(context, listen: false);
  providerServices?.getAllWalletDetails();
  providerServices?.getAllWalletHistory();
  providerServices?.getUserDetails();
 }


 void fundWallet(context) async {

   // setState(() {});
   var userId = await getAuthUserID();

   providerServices?.userFundWallet(
       map: {
         "amount": 10000000.toString(),
       },
       context: context);
 }

 getAuthUserID() async {
   String? userID = SessionManager.instance.authUserID;
   return userID;
 }



 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: SizedBox(
              width: double.maxFinite,
              child: Column(children: [
               SizedBox(height: 32.v),
               Expanded(
                   child:
                   SingleChildScrollView(child: _buildEWallet(context)))
              ])),
          bottomNavigationBar: _buildHome(context),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked));
 }

 /// Section Widget
 PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgArrowLeftPrimary,
          margin: EdgeInsets.only(left: 15.h, top: 13.v, bottom: 11.v),
          onTap: () {
           onTapArrowLeft(context);
          }),
      title: AppbarTitle(
          text: "E-Wallet", margin: EdgeInsets.only(left: 148.h)));
 }

 /// Section Widget
 Widget _buildEWallet(BuildContext context) {
   return Consumer<ProviderServices>(
     builder: (_, provider, __) {
       // Check if provider or walletData is null before accessing data
       if (provider.walletData?.status != "Success") {
         return Center(child: const CircularProgressIndicator());
       }


       // provider.walletData?.wallet == null
       TransactionData transactionData = provider.transactionData!;
       WalletInfo walletInfo = provider.walletData!.wallet!;
       UserInfo userInfo = provider.userData!.result.first!;

       // Assuming currencyFormat is an instance of NumberFormat
       NumberFormat currencyFormat = NumberFormat.currency(locale: 'en_NG', symbol: '\₦');
       int? balance = walletInfo?.balance;
       String formattedCurrency = currencyFormat.format(balance ?? 0);


       return Padding(
         padding: EdgeInsets.only(left: 27.h, right: 18.h, bottom: 503.v),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 7.v),
               decoration: AppDecoration.outlinePrimary
                   .copyWith(borderRadius: BorderRadiusStyle.roundedBorder13),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: EdgeInsets.only(bottom: 16.v),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           children: [
                             CustomImageView(
                               imagePath: userInfo.avatar ?? ImageConstant.imgEllipse350x50,
                               height: 50.adaptSize,
                               width: 50.adaptSize,
                               radius: BorderRadius.circular(25.h),
                             ),
                             Padding(
                               padding: EdgeInsets.only(
                                   left: 14.h, top: 15.v, bottom: 14.v),
                               child: Text(
                                 "Hi ${userInfo.firstName}",
                                 style: theme.textTheme.titleMedium,
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 6.v),
                         Align(
                           alignment: Alignment.centerRight,
                           child: Padding(
                             padding: EdgeInsets.only(right: 1.h),
                             child: Text(
                               "Your current balance is ",
                               style: CustomTextStyles.bodyMediumBlack900Regular14,
                             ),
                           ),
                         ),
                         SizedBox(height: 13.v),
                         Padding(
                           padding: EdgeInsets.only(left: 3.h),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               CustomImageView(
                                 imagePath: ImageConstant.imgIconWallet,
                                 height: 22.v,
                                 width: 25.h,
                                 margin: EdgeInsets.only(bottom: 6.v),
                               ),
                               Padding(
                                 padding: EdgeInsets.only(left: 22.h),
                                 child: Text(
                                   "${formattedCurrency}",
                                   style: CustomTextStyles.titleLarge23,
                                 ),
                               ),
                             ],
                           ),
                         ),
                         SizedBox(height: 45.v),
                         Text(
                           getFormattedDate(),
                           style: CustomTextStyles.bodyMediumBlack900Regular14,
                         ),
                         SizedBox(height: 8.v),
                         Text(
                           "Last updated",
                           style: CustomTextStyles.bodySmallBlack900,
                         ),
                       ],
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(top: 167.v, right: 32.h, bottom: 30.v),
                     child: TextButton(
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (builder) => AddFundsScreen()));
                         // fundWallet(context);
                       },
                       child: Text("Add Fund", style: theme.textTheme.titleMedium),
                     ),
                   ),
                 ],
               ),
             ),
             SizedBox(height: 18.v),
             Text("All transactions", style: CustomTextStyles.bodyMediumBlack900Regular14),
             TransactionListScreen(transactions: transactionData,)
           ],
         ),
       );
     },
   );
 }

 /// Section Widget
 Widget _buildHome(BuildContext context) {
  return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
   Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
  });
 }

 ///Handling route based on bottom click actions
 String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
   case BottomBarEnum.Home:
    return AppRoutes.carPage;
   case BottomBarEnum.Vuesaxlinearheart:
    return AppRoutes.favoritePage;
   case BottomBarEnum.Bag:
    return AppRoutes.lastBookTabContainerPage;
   case BottomBarEnum.User:
    return AppRoutes.profileOnePage;
   default:
    return "/";
  }
 }

 ///Handling page based on route
 Widget getCurrentPage(String currentRoute) {
  switch (currentRoute) {
   case AppRoutes.carPage:
    return CarPage();
   case AppRoutes.favoritePage:
    return FavoritePage();
   case AppRoutes.lastBookTabContainerPage:
    return LastBookTabContainerPage();
   case AppRoutes.profileOnePage:
    return ProfileOnePage();
   default:
    return DefaultWidget();
  }
 }

 /// Navigates back to the previous screen.
 onTapArrowLeft(BuildContext context) {
  Navigator.pop(context);
 }


 String getFormattedDate() {
   DateTime today = DateTime.now();
   String formattedDate = formatDate(today);
   return formattedDate;
 }

 String formatDate(DateTime date) {
   String daySuffix = date.day == 1 ? 'st' : (date.day == 2 ? 'nd' : (date.day == 3 ? 'rd' : 'th'));
   String formattedDate = "${date.day}$daySuffix ${getMonthName(date.month)}, ${date.year}";
   return formattedDate;
 }

 String getMonthName(int month) {
   switch (month) {
     case 1:
       return 'January';
     case 2:
       return 'February';
     case 3:
       return 'March';
     case 4:
       return 'April';
     case 5:
       return 'May';
     case 6:
       return 'June';
     case 7:
       return 'July';
     case 8:
       return 'August';
     case 9:
       return 'September';
     case 10:
       return 'October';
     case 11:
       return 'November';
     case 12:
       return 'December';
     default:
       return '';
   }
 }
}

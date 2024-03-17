import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kuddle_s_application27/main_core/session_manager.dart';
import 'package:kuddle_s_application27/models/register.dart';
import 'package:kuddle_s_application27/pages/bookings/model/transaction_data_model.dart';
import 'package:kuddle_s_application27/pages/home/model/property_list_model/property_list_model.dart';
import 'package:kuddle_s_application27/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apiservices/auth_repo.dart';
import '../../models/booking_response.dart';
import '../../models/favourites.dart';
import '../../models/flight_response.dart';
import '../../models/login.dart';
import '../../models/rooms.dart';
import '../../models/service_response.dart';
import '../../models/tour_response.dart';
import '../../models/vehicle_response.dart';
import '../../pages/bookings/model/booking_list_model.dart';
import '../../pages/bookings/model/user_detail_model.dart';
import '../../pages/bookings/model/wallet_data_model.dart';
import '../../pages/home/model/flight_list_model/flight_list_model.dart';
import '../../pages/home/model/services_list_model/services_list_model.dart';
import '../../pages/home/model/tour_list_model/tour_list_model.dart';
import '../../pages/home/model/vehicle_list_model/vehicle_list_model.dart';
import '../../presentation/home_page/home_page.dart';

class ProviderServices extends ChangeNotifier {
  AuthRepo authRepo = AuthRepo();
  bool? get isLoading => _isLoading;
  bool? _isLoading;
  late double finalDetailPrice;
  // RegisterModel? get registerModel => _registerModel;
  RegisterModel? _registerModel;
  PropertyListModel? get propertyListModel => _propertyListModel;
  PropertyListModel? _propertyListModel;
  LoginModel? get loginModel => _loginModel;
  LoginModel? _loginModel;
  VehicleListModel? get vehicleListModel => _vehicleListModel;
  VehicleListModel? _vehicleListModel;
  FlightListModel? get flightListModel => _flightListModel;
  FlightListModel? _flightListModel;
  TourListModel? get tourListModel => _tourListModel;
  TourListModel? _tourListModel;
  ServicesListModel? get serviceListModel => _serviceListModel;
  ServicesListModel? _serviceListModel;

  List<Favorite> get favoritesList => _favoritesList;
  late List<Favorite> _favoritesList;

  BookingListModel? get bookingListModel => _bookingListModel;
  BookingListModel? _bookingListModel;

  BookingResponse? get bookingResponse => _bookingResponse;
  BookingResponse? _bookingResponse;

  RoomModel? get roomModel => _roomModel;
  RoomModel? _roomModel;

  VehicleResponse? get vehicleResponse => _vehicleResponse;
  VehicleResponse? _vehicleResponse;

  FlightResponse? get flightResponse => _flightResponse;
  FlightResponse? _flightResponse;

  TourResponse? get tourResponse => _tourResponse;
  TourResponse? _tourResponse;

  ServiceResponse? get serviceResponse => _serviceResponse;
  ServiceResponse? _serviceResponse;

  WalletData? get walletData => _walletData;
  WalletData? _walletData;

  UserData? get userData => _userData;
  UserData? _userData;

  TransactionData? get transactionData => _transactionData;
  TransactionData? _transactionData;


  void signIn({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();


      Response? response = await authRepo.login(map!);

      if (response != null && response.statusCode == 200) {
        print('response is $response');
        print('${response.data}');


        _loginModel = LoginModel.fromJson(response.data);
        // Display success message in Snackbar
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('${_loginModel?.message}'),
          duration: const Duration(seconds: 4), // Adjust duration as needed
          action: SnackBarAction(
            label: 'DISMISS',
            onPressed: () {
              ScaffoldMessenger.of(context!).hideCurrentSnackBar();
            },
          ),
        ));

        // Check for success message and navigate to the sign-in screen
        if (_loginModel?.success == true) {
          SessionManager.instance.isLoggedIn = true;

          if (_loginModel != null && _loginModel!.token != null) {

            SessionManager.instance.authToken = _loginModel!.token!;
            SessionManager.instance.authUserID = _loginModel!.userID.toString();


          }

          print('${SessionManager.instance.authToken}');
          print('${_loginModel!.token.toString()} for login _model');
          print('${loginModel!.token.toString()} for login model');
          print('it should be here by now');
          _isLoading = false;
          Navigator.pushReplacement(
            context!,
            MaterialPageRoute(
              builder: (context) =>
                  HomePage(selectedIndex: 0,), // Replace SignInScreen with your actual sign-in screen
            ),

          );
        }
      } else {
        // Handle other status codes
        handleStatusCodeError(context, response?.statusCode);
      }
    } on DioError catch (e) {
      handleDioError(context, e);
    } catch (e, str) {
      handleOtherException(context, e, str);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

// The rest of your helper functions (handleStatusCodeError, handleOtherException, showSnackBar) remain unchanged.


  void signOut() async {
    try {
      SessionManager.instance.logOut();

      SessionManager.instance.isLoggedIn = false;

      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void register({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();


      Response? response = await authRepo.register(map!);

      if (response != null && response.statusCode == 200) {
        print('response is $response');
        _registerModel = RegisterModel.fromJson(response.data);
        print(_registerModel);

        // Display success message in Snackbar
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('${_registerModel?.message}'),
          duration: const Duration(seconds: 4), // Adjust duration as needed
          action: SnackBarAction(
            label: 'DISMISS',
            onPressed: () {
              ScaffoldMessenger.of(context!).hideCurrentSnackBar();
            },
          ),
        ));


        if (_registerModel?.success == true) {
          _isLoading = false;
          Navigator.pushReplacement(
            context!,
            MaterialPageRoute(
              builder: (context) =>
                  SignInScreen(), // Replace SignInScreen with your actual sign-in screen
            ),
          );

        }
      } else {
        // Handle other status codes
        handleStatusCodeError(context, response?.statusCode);
      }
    } on DioError catch (e) {
      handleDioError(context, e);
    } catch (e, str) {
      handleOtherException(context, e, str);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  void handleStatusCodeError(BuildContext? context, int? statusCode) {
    // Handle different status codes
    if (statusCode != null) {
      switch (statusCode) {
        case 400:
        // Bad Request
          showSnackBars(
              context, 'Password must have capital letter and number');
          break;
        case 401:
        // Unauthorized
          showSnackBars(context, 'Unauthorized: Please check your credentials');
          // Handle unauthorized scenario (if needed)
          break;
        case 403:
        // Forbidden
          showSnackBars(context,
              'Forbidden: You do not have permission to access this resource');
          break;
      // Add more cases for other status codes as needed
        default:
        // Default error message
          showSnackBars(context, 'An error occurred');
          break;
      }
    } else {
      showSnackBars(context, 'An error occurred');
    }
  }

  void handleDioError(BuildContext? context, DioError e) {
    // Handle DioError based on response status code
    if (e.response != null) {
      final int statusCode = e.response!.statusCode!;
      final String errorMessage = e.response!.data['message'] ??
          'An error occurred';

      // Display different messages for specific status codes
      handleStatusCodeError(context, statusCode);
    } else {
      // Handle other DioError types
      showSnackBars(context, 'An error occurred');
    }
  }

  void handleOtherException(BuildContext? context, dynamic e, dynamic str) {
    // Handle other exceptions
    showSnackBars(context, 'An error occurred');
    debugPrint("Error: $e");
    debugPrint("StackTrace: $str");
  }

  void showSnackBars(BuildContext? context, String message) {
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 4), // Adjust duration as needed
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));
  }


  void getAllPropertiesList() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getPropertyList();
      if (response != null && response.statusCode == 200) {
        _propertyListModel = PropertyListModel.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void getAllVehiclesList() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getVehicleList();
      if (response != null && response.statusCode == 200) {
        _vehicleListModel = VehicleListModel.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void getAllFlightsList() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getFlightList();
      if (response != null && response.statusCode == 200) {
        _flightListModel = FlightListModel.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void getAllToursList() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getTourList();
      if (response != null && response.statusCode == 200) {
        _tourListModel = TourListModel.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void getAllServicesList() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getServiceList();
      if (response != null && response.statusCode == 200) {
        _serviceListModel = ServicesListModel.fromJson(response.data);
        _isLoading = false;

      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void getAllBookingsList() async {
    try {
      _isLoading = true;

      Response? response = await authRepo.getBookedRooms();

      if (response != null) {
        if (response.statusCode == 200) {
          _bookingResponse = BookingResponse.fromJson(response.data);
          // print(bookingResponse.status);

          // print('we are here $_bookingList');
        }

        _isLoading = false;
        notifyListeners();
      }
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void getAllRoomsList($roomID) async {
    try {
      _isLoading = true;

      Response? response = await authRepo.getAllRoomsInHotel($roomID);

      if (response != null) {
        if (response.statusCode == 200) {
          _roomModel = RoomModel.fromJson(response.data);
          // print(bookingResponse.status);

          // print('we are here $_bookingList');
        }
        _isLoading = false;
        notifyListeners();
      }
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void getAllBookedVehiclesList() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getBookedVehicles();

      if (response != null) {
        if (response.statusCode == 200) {
          _vehicleResponse = VehicleResponse.fromJson(response.data);
          // print(bookingResponse.status);

          // print('we are here $_bookingList');
        }

        _isLoading = false;
        notifyListeners();
      }
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }



  void getAllBookedFlightsList() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getBookedFlights();

      if (response != null) {
        if (response.statusCode == 200) {
          _flightResponse = FlightResponse.fromJson(response.data);
          // print(bookingResponse.status);

          // print('we are here $_bookingList');
        }

        _isLoading = false;
        notifyListeners();
      }
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void getAllBookedToursList() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getBookedTours();

      if (response != null) {
        if (response.statusCode == 200) {
          _tourResponse = TourResponse.fromJson(response.data);
          // print(bookingResponse.status);

          // print('we are here $_bookingList');
        }

        _isLoading = false;
        notifyListeners();
      }
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }



  void getAllBookedServicesList() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getBookedServices();

      if (response != null) {
        if (response.statusCode == 200) {
          _serviceResponse = ServiceResponse.fromJson(response.data);
          // print(bookingResponse.status);

          // print('we are here $_bookingList');
        }

        _isLoading = false;
        notifyListeners();
      }
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }



  void getAllBookedRoomList() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getBookedRooms();
      if (response != null && response.statusCode == 200) {
        _bookingListModel = BookingListModel.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }



  void getAllWalletHistory() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getUserWalletTransactions();
      if (response != null && response.statusCode == 200) {
        _transactionData = TransactionData.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }



  void getUserDetails() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getUserDetails();
      if (response != null && response.statusCode == 200) {
        _userData = UserData.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  // getAllWalletHistory()
  // getAllWalletDetails()
  void getAllWalletDetails() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getUserWallet();
      if (response != null && response.statusCode == 200) {
        print('response from provider is $response');
        _walletData = WalletData.fromJson(response.data);
        // _bookingListModel = BookingListModel.fromJson(response.data);
        _isLoading = false;
      }
      if (response != null && response.statusCode != 200) {
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }



  void addOrder({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.addOrder(map!);
      if (response != null && response.statusCode == 200) {
        // _addProductToCartModel = AddProductToCartModel.fromJson(response.data);
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('Booking Successful'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () {},
          // ),
        ));
        _isLoading = false;

        notifyListeners();
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('Failed to add Order, please make payment'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () {},
          // ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void updateProfile({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.updateProfile(map!);
      if (response != null && response.statusCode == 200) {
        notifyListeners();
        // _addProductToCartModel = AddProductToCartModel.fromJson(response.data);
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('update profile successfully'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () {},
          // ),
        ));
        _isLoading = false;

        notifyListeners();
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('Failed to update profile'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () {},
          // ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void addAvatar({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.addUserAvatar(map!);
      if (response != null && response.statusCode == 200) {
        // _addProductToCartModel = AddProductToCartModel.fromJson(response.data);
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('avatar updated successfully'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () {},
          // ),
        ));
        _isLoading = false;

        notifyListeners();
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('Failed to update avatar'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () {},
          // ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }



  void userFundWallet({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.fundWallet(map!);
      if (response != null && response.statusCode == 200) {
        print("response is from fund wallet $response");
        // _walletData = WalletData.fromJson(response.data);
        print('wallet from provider is$_walletData');
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('Wallet funded successfully'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () {},
          // ),
        ));
        _isLoading = false;

        notifyListeners();
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('Failed to fund wallet, pls check card details'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () {},
          // ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void userPayWithWallet({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.payWithWallet(map!);
      if (response != null && response.statusCode == 200) {
        //
        // print("response is from fund wallet $response");
        // // _walletData = WalletData.fromJson(response.data);
        // print('wallet from provider is$_walletData');
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('Payment successfull'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () {},
          // ),
        ));
        _isLoading = false;

        notifyListeners();
      }

      if (response != null && response.statusCode != 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text('Failed to add Order, please make payment'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () {},
          // ),
        ));

        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }





  Future<List<Favorite>> getFavoritesList() async {
    var favoritesBox = await Hive.openBox<Favorite>('favoritesBox');
    return favoritesBox.values.toList();
  }

  Future<void> initializeFavorites() async {
    _favoritesList = [];
    try {
      var list = await getFavoritesList();
      _favoritesList = list;
      print('Favorites List: $favoritesList');
    } catch (e) {
      print('Error getting favorites list: $e');
    }
    notifyListeners();
  }

  Future<void> removeFromFavorites(Favorite favorite) async {
    // Implement the logic to remove the favorite
    // Notify listeners after removal
    _favoritesList.remove(favorite);
    notifyListeners();
  }

}
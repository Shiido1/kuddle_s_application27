import 'dart:developer';

import 'package:dio/dio.dart';

import '../main_core/session_manager.dart';
import 'api_services.dart';

class AuthRepo with ApiServices {
  Future<Response?> login(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("login", credentials);

    if (response != null) {

      return response;
    }

    return null;
  }

  Future<Response?> register(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("signup", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> sendOtp(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("send-otp", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> acceptRejectBooking(Map<String, String> credentials) async {
    Response? response =
        await apiPostRequests("accept-reject-bookings", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }

  Future<Response?> deleteAccount(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("delete-account", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }




  Future<Response?> verifyOtp(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("verify-otp", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> addBooking(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("book-service", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> addQuantity(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("add-qty-cart", credentials);
    log(response.toString());
    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> reduceQuantity(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("sub-qty-cart", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> removeProduct(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("remove-product", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> addProductToCart(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("add_cart", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> addOrder(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("booking", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }


  // {
  //
  // "amountPaid":"45600",
  // "bookingFor":"",
  // "checkInDate":"2023-10-19",
  // "checkInTime":"",
  // "checkOutDate":"2023-10-20",
  // "checkOutTime":"",
  // "duration":"2",
  // "hostID":"4",
  // "itemID":"1",
  // "itemType":"vehicle",
  // "itemUnitPrice":"24000",
  // "tickets":0,
  // "userID":"9",
  // "paymentStatus": "1"
  //
  // }

  // Future<Response?> updateProfile(Map<String, String> credentials) async {
  //   Response? response = await apiPostRequests("update_profile", credentials);
  //
  //   if (response != null) {
  //     return response;
  //   }
  //
  //   return null;
  // }

  // Future<Map<String, dynamic>?> updateProfile(
  //     Map<String, dynamic> credentials) async {
  //   Map<String, dynamic>? response =
  //       await apiUploadPostRequests("update_profile", credentials);
  //
  //   if (response != null) {
  //     return response;
  //   }
  //
  //   return null;
  // }

  Future<Response?> customerHome(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("home", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> userDetail() async {
    Response? response = await apiGetRequests("user_details");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> userLocation() async {
    Response? response = await apiGetRequests("get-location");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> services() async {
    Response? response = await apiGetRequests("get-all-service-categories");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> referrals() async {
    Response? response = await apiGetRequests("referrals");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> referredUsersWithBookings() async {
    Response? response = await apiGetRequests("referredUsersWithBookings");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> cartlist() async {
    Response? response = await apiGetRequests("cart_list");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> rateCustomer(Map<String, String> credentials) async {
    Response? response =
        await apiPostRequests("rate-service-provider", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }

  Future<Response?> upcomingBookings() async {
    Response? response = await apiGetRequests("bookingsservicelist/1");

    if (response != null) {
      return response;
    }

    return null;
  }



  Future<Response?> completedBookings() async {
    Response? response = await apiGetRequests("bookingsservicelist/2");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> canceledBookings() async {
    Response? response = await apiGetRequests("bookingsservicelist/3");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> sendPasswordChange(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("forgot-password", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> changePassword(Map<String, String> credentials) async {
    Response? response =
        await apiPostRequests("forgot-password-change", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }





  Future<Response?> getPropertyList() async {
    Response? response = await apiGetRequests("/propertylist");

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> getVehicleList() async {
    Response? response = await apiGetRequests("/vehiclelist");

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> getServiceList() async {
    Response? response = await apiGetRequests("/servicelist");

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> getTourList() async {
    Response? response = await apiGetRequests("/tourlist");

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> getFlightList() async {
    Response? response = await apiGetRequests("/flightlist");

    if (response != null) {
      return response;
    }

    return null;
  }

  getAuthUserID() async {
    String? userID = SessionManager.instance.authUserID;
    return userID;
  }

  Future<Response?> getBookedRooms() async {

    var userID = await getAuthUserID();
    Response? response = await apiGetRequests("/bookeditems/$userID");

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> getAllRoomsInHotel($roomID) async {

    var roomID = $roomID;
    Response? response = await apiGetRequests("/available-room/$roomID");

    if (response != null) {
      return response;
    }
    return null;
  }

  Future<Response?> getBookedVehicles() async {
    var userID = await getAuthUserID();
    Response? response = await apiGetRequests("/bookedvehicles/$userID");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> getBookedFlights() async {
    var userID = await getAuthUserID();
    Response? response = await apiGetRequests("/bookedflights/$userID");

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> getUserWallet() async {
    var userID = await getAuthUserID();
    Response? response = await apiGetRequests("/wallet/$userID");
    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> getUserWalletTransactions() async {
    var userID = await getAuthUserID();
    Response? response = await apiGetRequests("/wallet/transactions/$userID");
    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> payWithWallet(Map<String, String> credentials) async {
    var userID = await getAuthUserID();
    Response? response = await apiPatchRequests("/wallet/pay/$userID",credentials);

    if (response != null) {
      return response;
    }

    return null;
  }



  Future<Response?> updateProfile(Map<String, String> credentials) async {
    var userID = await getAuthUserID();
    Response? response = await apiPutRequests("/edituserdetails/$userID",credentials);

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> addUserAvatar(Map<String, String> credentials) async {
    // var userID = await getAuthUserID();
    Response? response = await apiPostRequests("/add-user-avatar",credentials);

    if (response != null) {
      return response;
    }

    return null;
  }



  // edituserdetails/9
  // add-user-avatar
  // fetchuserdetails/9

  // Future<Response?> fundWallet(Map<String, String> credentials) async {
  //   var userID = await getAuthUserID();
  //   Response? response = await apiPatchRequests("wallet/fund/$userID",credentials))
  //
  //   if (response != null) {
  //     return response;
  //   }
  //
  //   return null;
  // }



  Future<Response?> fundWallet(Map<String, String> credentials) async {
    var userID = await getAuthUserID();
    Response? response = await apiPatchRequests("wallet/fund/$userID", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }


  // Future<Response?> fundWallet(Map<String, String> credentials) async {
  //   Response? response = await apiPostRequests("update_profile", credentials);
  //
  //   if (response != null) {
  //     return response;
  //   }
  //
  //   return null;
  // }


  // Future<Response?> updateProfile(Map<String, String> credentials) async {
  //   Response? response = await apiPostRequests("update_profile", credentials);
  //
  //   if (response != null) {
  //     return response;
  //   }
  //
  //   return null;
  // }


  Future<Response?> getBookedTours() async {
    var userID = await getAuthUserID();
    Response? response = await apiGetRequests("/bookedtours/$userID");

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> getBookedServices() async {
    var userID = await getAuthUserID();
    Response? response = await apiGetRequests("/bookedservices/$userID");

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> getUserDetails() async {
    var userID = await getAuthUserID();
    Response? response = await apiGetRequests("/fetchuserdetails/$userID");

    if (response != null) {
      return response;
    }
  }





  // Future<Response?> initialiseTransaction() async {
  //   Response? response = await apiPostRequests("/transaction/initialize");
  //
  //   if (response != null) {
  //     return response;
  //   }
  //
  //   return null;
  // }
  //



}

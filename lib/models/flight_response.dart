import 'dart:convert';

class FlightResponse {
  final String? status;
  final int? page;
  final int? count;
  final List<Flight>? result;

  FlightResponse({
    this.status,
    this.page,
    this.count,
    this.result,
  });

  factory FlightResponse.fromJson(Map<String, dynamic> json) {
    return FlightResponse(
      status: json['status'],
      page: json['page'],
      count: json['count'],
      result: List<Flight>.from((json['result'] as List).map((result) => Flight.fromJson(result))),
    );
  }
}

class Flight {
  final int? bookingID;
  final int? itemID;
  final int? hostID;
  final int? userID;
  final String? itemType;
  final String? itemUnitPrice;
  final String? amountPaid;
  final String? bookingFor;
  final String? checkInDate;
  final String? checkInTime;
  final String? checkOutDate;
  final String? checkOutTime;
  final String? duration;
  final int? tickets;
  final String? paymentStatus;
  final int? cancelBooking;
  final int? refundStatus;
  final int? confirmation;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? roomID;
  final int? flightID;
  final String? roomType;
  final int? roomNo;
  final int? guestNo;
  final int? bathroomNo;
  final String? roomBedType;
  final String? price;
  final String? discount;
  final String? available;
  final String? agreeCancel;
  final String? flightName;
  final String? flightType;
  final String? city;
  final String? zipCode;
  final String? stateProvince;
  final String? country;
  final String? streetAddress;
  final String? aboutflight;
  final String? hostName;
  final String? aboutHost;
  final String? phoneNumber;
  final String? aboutNeighborhood;
  final int? approvalStatus;
  final int? flightImageID;
  final String? flightPic1;
  final String? flightPic2;
  final String? flightPic3;
  final String? flightPic4;
  final String? flightPic5;

  Flight({
    this.bookingID,
    this.itemID,
    this.hostID,
    this.userID,
    this.itemType,
    this.itemUnitPrice,
    this.amountPaid,
    this.bookingFor,
    this.checkInDate,
    this.checkInTime,
    this.checkOutDate,
    this.checkOutTime,
    this.duration,
    this.tickets,
    this.paymentStatus,
    this.cancelBooking,
    this.refundStatus,
    this.confirmation,
    this.updatedAt,
    this.createdAt,
    this.roomID,
    this.flightID,
    this.roomType,
    this.roomNo,
    this.guestNo,
    this.bathroomNo,
    this.roomBedType,
    this.price,
    this.discount,
    this.available,
    this.agreeCancel,
    this.flightName,
    this.flightType,
    this.city,
    this.zipCode,
    this.stateProvince,
    this.country,
    this.streetAddress,
    this.aboutflight,
    this.hostName,
    this.aboutHost,
    this.phoneNumber,
    this.aboutNeighborhood,
    this.approvalStatus,
    this.flightImageID,
    this.flightPic1,
    this.flightPic2,
    this.flightPic3,
    this.flightPic4,
    this.flightPic5,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      bookingID: json['bookingID'],
      itemID: json['itemID'],
      hostID: json['hostID'],
      userID: json['userID'],
      itemType: json['itemType'],
      itemUnitPrice: json['itemUnitPrice'],
      amountPaid: json['amountPaid'],
      bookingFor: json['bookingFor'],
      checkInDate: json['checkInDate'],
      checkInTime: json['checkInTime'],
      checkOutDate: json['checkOutDate'],
      checkOutTime: json['checkOutTime'],
      duration: json['duration'],
      tickets: json['tickets'],
      paymentStatus: json['paymentStatus'],
      cancelBooking: json['cancelBooking'],
      refundStatus: json['refundStatus'],
      confirmation: json['confirmation'],
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,

      roomID: json['roomID'],
      flightID: json['flightID'],
      roomType: json['roomType'],
      roomNo: json['roomNo'],
      guestNo: json['guestNo'],
      bathroomNo: json['bathroomNo'],
      roomBedType: json['roomBedType'],
      price: json['price'],
      discount: json['discount'],
      available: json['available'],
      agreeCancel: json['agreeCancel'],
      flightName: json['flightName'],
      flightType: json['flightType'],
      city: json['city'],
      zipCode: json['zipCode'],
      stateProvince: json['stateProvince'],
      country: json['country'],
      streetAddress: json['streetAddress'],
      aboutflight: json['aboutflight'],
      hostName: json['hostName'],
      aboutHost: json['aboutHost'],
      phoneNumber: json['phoneNumber'],
      aboutNeighborhood: json['aboutNeighborhood'],
      approvalStatus: json['approvalStatus'],
      flightImageID: json['flightImageID'],
      flightPic1: json['flightPic1'],
      flightPic2: json['flightPic2'],
      flightPic3: json['flightPic3'],
      flightPic4: json['flightPic4'],
      flightPic5: json['flightPic5'],
    );
  }
}

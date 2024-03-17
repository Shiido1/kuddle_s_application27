import 'dart:convert';

class BookingResponse {
  final String? status;
  final int? page;
  final int? count;
  final List<Booking>? result;

  BookingResponse({
    this.status,
    this.page,
    this.count,
    this.result,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      status: json['status'],
      page: json['page'],
      count: json['count'],
      result: List<Booking>.from((json['result'] as List).map((result) => Booking.fromJson(result))),
    );
  }
}

class Booking {
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
  final int? propertyID;
  final String? roomType;
  final int? roomNo;
  final int? guestNo;
  final int? bathroomNo;
  final String? roomBedType;
  final String? price;
  final String? discount;
  final String? available;
  final String? agreeCancel;
  final String? propertyName;
  final String? propertyType;
  final String? city;
  final String? zipCode;
  final String? stateProvince;
  final String? country;
  final String? streetAddress;
  final String? aboutProperty;
  final String? hostName;
  final String? aboutHost;
  final String? phoneNumber;
  final String? aboutNeighborhood;
  final int? approvalStatus;
  final int? propertyImageID;
  final String? propertyPic1;
  final String? propertyPic2;
  final String? propertyPic3;
  final String? propertyPic4;
  final String? propertyPic5;

  Booking({
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
    this.propertyID,
    this.roomType,
    this.roomNo,
    this.guestNo,
    this.bathroomNo,
    this.roomBedType,
    this.price,
    this.discount,
    this.available,
    this.agreeCancel,
    this.propertyName,
    this.propertyType,
    this.city,
    this.zipCode,
    this.stateProvince,
    this.country,
    this.streetAddress,
    this.aboutProperty,
    this.hostName,
    this.aboutHost,
    this.phoneNumber,
    this.aboutNeighborhood,
    this.approvalStatus,
    this.propertyImageID,
    this.propertyPic1,
    this.propertyPic2,
    this.propertyPic3,
    this.propertyPic4,
    this.propertyPic5,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
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
      propertyID: json['propertyID'],
      roomType: json['roomType'],
      roomNo: json['roomNo'],
      guestNo: json['guestNo'],
      bathroomNo: json['bathroomNo'],
      roomBedType: json['roomBedType'],
      price: json['price'],
      discount: json['discount'],
      available: json['available'],
      agreeCancel: json['agreeCancel'],
      propertyName: json['propertyName'],
      propertyType: json['propertyType'],
      city: json['city'],
      zipCode: json['zipCode'],
      stateProvince: json['stateProvince'],
      country: json['country'],
      streetAddress: json['streetAddress'],
      aboutProperty: json['aboutProperty'],
      hostName: json['hostName'],
      aboutHost: json['aboutHost'],
      phoneNumber: json['phoneNumber'],
      aboutNeighborhood: json['aboutNeighborhood'],
      approvalStatus: json['approvalStatus'],
      propertyImageID: json['propertyImageID'],
      propertyPic1: json['propertyPic1'],
      propertyPic2: json['propertyPic2'],
      propertyPic3: json['propertyPic3'],
      propertyPic4: json['propertyPic4'],
      propertyPic5: json['propertyPic5'],
    );
  }
}

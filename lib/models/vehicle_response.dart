import 'dart:convert';

class VehicleResponse {
  final String? status;
  final int? page;
  final int? count;
  final List<Vehicle>? result;

  VehicleResponse({
    this.status,
    this.page,
    this.count,
    this.result,
  });

  factory VehicleResponse.fromJson(Map<String, dynamic> json) {
    return VehicleResponse(
      status: json['status'],
      page: json['page'],
      count: json['count'],
      result: List<Vehicle>.from((json['result'] as List).map((result) => Vehicle.fromJson(result))),
    );
  }
}

class Vehicle {
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
  final int? vehicleID;
  final String? roomType;
  final int? roomNo;
  final int? guestNo;
  final int? bathroomNo;
  final String? roomBedType;
  final String? price;
  final String? discount;
  final dynamic available;
  final String? agreeCancel;
  final String? vehicleName;
  final String? vehicleType;
  final String? city;
  final String? zipCode;
  final String? stateProvince;
  final String? country;
  final String? streetAddress;
  final String? aboutvehicle;
  final String? hostName;
  final String? aboutHost;
  final String? phoneNumber;
  final String? aboutNeighborhood;
  final int? approvalStatus;
  final int? vehicleImageID;
  final String? bookedDates;
  final String? vehiclePic1;
  final String? vehiclePic2;
  final String? vehiclePic3;
  final String? vehiclePic4;
  final String? vehiclePic5;

  Vehicle({
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
    this.vehicleID,
    this.roomType,
    this.roomNo,
    this.guestNo,
    this.bathroomNo,
    this.roomBedType,
    this.price,
    this.discount,
    this.available,
    this.agreeCancel,
    this.vehicleName,
    this.vehicleType,
    this.city,
    this.zipCode,
    this.stateProvince,
    this.country,
    this.streetAddress,
    this.aboutvehicle,
    this.hostName,
    this.aboutHost,
    this.phoneNumber,
    this.aboutNeighborhood,
    this.approvalStatus,
    this.vehicleImageID,
    this.vehiclePic1,
    this.vehiclePic2,
    this.vehiclePic3,
    this.vehiclePic4,
    this.vehiclePic5,
    this.bookedDates,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
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
      bookedDates: json['bookedDates'],
      roomID: json['roomID'],
      vehicleID: json['vehicleID'],
      roomType: json['roomType'],
      roomNo: json['roomNo'],
      guestNo: json['guestNo'],
      bathroomNo: json['bathroomNo'],
      roomBedType: json['roomBedType'],
      price: json['price'],
      discount: json['discount'],
      available: json['available']  ,
      agreeCancel: json['agreeCancel'],
      vehicleName: json['vehicleName'],
      vehicleType: json['vehicleType'],
      city: json['city'],
      zipCode: json['zipCode'],
      stateProvince: json['stateProvince'],
      country: json['country'],
      streetAddress: json['streetAddress'],
      aboutvehicle: json['aboutvehicle'],
      hostName: json['hostName'],
      aboutHost: json['aboutHost'],
      phoneNumber: json['phoneNumber'],
      aboutNeighborhood: json['aboutNeighborhood'],
      approvalStatus: json['approvalStatus'],
      vehicleImageID: json['vehicleImageID'],
      vehiclePic1: json['vehiclePic1'],
      vehiclePic2: json['vehiclePic2'],
      vehiclePic3: json['vehiclePic3'],
      vehiclePic4: json['vehiclePic4'],
      vehiclePic5: json['vehiclePic5'],
    );
  }
}

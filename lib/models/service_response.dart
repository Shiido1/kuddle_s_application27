import 'dart:convert';

class ServiceResponse {
  final String? status;
  final int? page;
  final int? count;
  final List<Service>? result;

  ServiceResponse({
    this.status,
    this.page,
    this.count,
    this.result,
  });

  factory ServiceResponse.fromJson(Map<String, dynamic> json) {
    return ServiceResponse(
      status: json['status'],
      page: json['page'],
      count: json['count'],
      result: List<Service>.from((json['result'] as List).map((result) => Service.fromJson(result))),
    );
  }
}

class Service {
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
  final int? serviceID;
  final String? roomType;
  final int? roomNo;
  final int? guestNo;
  final int? bathroomNo;
  final String? roomBedType;
  final String? price;
  final String? discount;
  final String? available;
  final String? agreeCancel;
  final String? serviceName;
  final String? serviceType;
  final String? city;
  final String? zipCode;
  final String? stateProvince;
  final String? country;
  final String? streetAddress;
  final String? aboutservice;
  final String? hostName;
  final String? aboutHost;
  final String? phoneNumber;
  final String? aboutNeighborhood;
  final int? approvalStatus;
  final int? serviceImageID;
  final String? servicePic1;
  final String? servicePic2;
  final String? servicePic3;
  final String? servicePic4;
  final String? servicePic5;

  Service({
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
    this.serviceID,
    this.roomType,
    this.roomNo,
    this.guestNo,
    this.bathroomNo,
    this.roomBedType,
    this.price,
    this.discount,
    this.available,
    this.agreeCancel,
    this.serviceName,
    this.serviceType,
    this.city,
    this.zipCode,
    this.stateProvince,
    this.country,
    this.streetAddress,
    this.aboutservice,
    this.hostName,
    this.aboutHost,
    this.phoneNumber,
    this.aboutNeighborhood,
    this.approvalStatus,
    this.serviceImageID,
    this.servicePic1,
    this.servicePic2,
    this.servicePic3,
    this.servicePic4,
    this.servicePic5,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
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
      serviceID: json['serviceID'],
      roomType: json['roomType'],
      roomNo: json['roomNo'],
      guestNo: json['guestNo'],
      bathroomNo: json['bathroomNo'],
      roomBedType: json['roomBedType'],
      price: json['price'],
      discount: json['discount'],
      available: json['available'],
      agreeCancel: json['agreeCancel'],
      serviceName: json['serviceName'],
      serviceType: json['serviceType'],
      city: json['city'],
      zipCode: json['zipCode'],
      stateProvince: json['stateProvince'],
      country: json['country'],
      streetAddress: json['streetAddress'],
      aboutservice: json['aboutservice'],
      hostName: json['hostName'],
      aboutHost: json['aboutHost'],
      phoneNumber: json['phoneNumber'],
      aboutNeighborhood: json['aboutNeighborhood'],
      approvalStatus: json['approvalStatus'],
      serviceImageID: json['serviceImageID'],
      servicePic1: json['servicePic1'],
      servicePic2: json['servicePic2'],
      servicePic3: json['servicePic3'],
      servicePic4: json['servicePic4'],
      servicePic5: json['servicePic5'],
    );
  }
}

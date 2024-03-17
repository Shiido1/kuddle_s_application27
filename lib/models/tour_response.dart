import 'dart:convert';

class TourResponse {
  final String? status;
  final int? page;
  final int? count;
  final List<Tour>? result;

  TourResponse({
    this.status,
    this.page,
    this.count,
    this.result,
  });

  factory TourResponse.fromJson(Map<String, dynamic> json) {
    return TourResponse(
      status: json['status'],
      page: json['page'],
      count: json['count'],
      result: List<Tour>.from((json['result'] as List).map((result) => Tour.fromJson(result))),
    );
  }
}

class Tour {
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
  final int? tourID;
  final String? roomType;
  final int? roomNo;
  final int? guestNo;
  final int? bathroomNo;
  final String? roomBedType;
  final String? price;
  final String? discount;
  final String? available;
  final String? agreeCancel;
  final String? tourName;
  final String? tourType;
  final String? city;
  final String? zipCode;
  final String? stateProvince;
  final String? country;
  final String? streetAddress;
  final String? abouttour;
  final String? hostName;
  final String? aboutHost;
  final String? phoneNumber;
  final String? aboutNeighborhood;
  final int? approvalStatus;
  final int? tourImageID;
  final String? tourPic1;
  final String? tourPic2;
  final String? tourPic3;
  final String? tourPic4;
  final String? tourPic5;

  Tour({
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
    this.tourID,
    this.roomType,
    this.roomNo,
    this.guestNo,
    this.bathroomNo,
    this.roomBedType,
    this.price,
    this.discount,
    this.available,
    this.agreeCancel,
    this.tourName,
    this.tourType,
    this.city,
    this.zipCode,
    this.stateProvince,
    this.country,
    this.streetAddress,
    this.abouttour,
    this.hostName,
    this.aboutHost,
    this.phoneNumber,
    this.aboutNeighborhood,
    this.approvalStatus,
    this.tourImageID,
    this.tourPic1,
    this.tourPic2,
    this.tourPic3,
    this.tourPic4,
    this.tourPic5,
  });

  factory Tour.fromJson(Map<String, dynamic> json) {
    return Tour(
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
      tourID: json['tourID'],
      roomType: json['roomType'],
      roomNo: json['roomNo'],
      guestNo: json['guestNo'],
      bathroomNo: json['bathroomNo'],
      roomBedType: json['roomBedType'],
      price: json['price'],
      discount: json['discount'],
      available: json['available'],
      agreeCancel: json['agreeCancel'],
      tourName: json['tourName'],
      tourType: json['tourType'],
      city: json['city'],
      zipCode: json['zipCode'],
      stateProvince: json['stateProvince'],
      country: json['country'],
      streetAddress: json['streetAddress'],
      abouttour: json['abouttour'],
      hostName: json['hostName'],
      aboutHost: json['aboutHost'],
      phoneNumber: json['phoneNumber'],
      aboutNeighborhood: json['aboutNeighborhood'],
      approvalStatus: json['approvalStatus'],
      tourImageID: json['tourImageID'],
      tourPic1: json['tourPic1'],
      tourPic2: json['tourPic2'],
      tourPic3: json['tourPic3'],
      tourPic4: json['tourPic4'],
      tourPic5: json['tourPic5'],
    );
  }
}

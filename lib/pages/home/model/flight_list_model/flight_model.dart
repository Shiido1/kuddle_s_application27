import 'package:equatable/equatable.dart';

class FlightModel extends Equatable {
  final int? flightId;
  final int? hostId;
  final String? fromWhere;
  final String? toWhere;
  final String? departure;
  final String? arrival;
  final String? estimatedHours;
  final String? estimatedMinutes;
  final String? tripType;
  final String? stops;
  final String? ticketType;
  final String? flightCategory;
  final String? flexibility;
  final String? hostName;
  final String? aboutAgency;
  final String? phoneNumber;
  final String? price;
  final String? discount;
  final String? agreeCancel;
  final int? approvalStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? flightImageId;
  final String? flightPic1;
  final String? flightPic2;

  const FlightModel({
    this.flightId,
    this.hostId,
    this.fromWhere,
    this.toWhere,
    this.departure,
    this.arrival,
    this.estimatedHours,
    this.estimatedMinutes,
    this.tripType,
    this.stops,
    this.ticketType,
    this.flightCategory,
    this.flexibility,
    this.hostName,
    this.aboutAgency,
    this.phoneNumber,
    this.price,
    this.discount,
    this.agreeCancel,
    this.approvalStatus,
    this.createdAt,
    this.updatedAt,
    this.flightImageId,
    this.flightPic1,
    this.flightPic2,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
        flightId: json['flightID'] as int?,
        hostId: json['hostID'] as int?,
        fromWhere: json['fromWhere'] as String?,
        toWhere: json['toWhere'] as String?,
        departure: json['departure'] as String?,
        arrival: json['arrival'] as String?,
        estimatedHours: json['estimatedHours'] as String?,
        estimatedMinutes: json['estimatedMinutes'] as String?,
        tripType: json['tripType'] as String?,
        stops: json['stops'] as String?,
        ticketType: json['ticketType'] as String?,
        flightCategory: json['flightCategory'] as String?,
        flexibility: json['flexibility'] as String?,
        hostName: json['hostName'] as String?,
        aboutAgency: json['aboutAgency'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        price: json['price'] as String?,
        discount: json['discount'] as String?,
        agreeCancel: json['agreeCancel'] as String?,
        approvalStatus: json['approvalStatus'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        flightImageId: json['flightImageID'] as int?,
        flightPic1: json['flightPic1'] as String?,
        flightPic2: json['flightPic2'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'flightID': flightId,
        'hostID': hostId,
        'fromWhere': fromWhere,
        'toWhere': toWhere,
        'departure': departure,
        'arrival': arrival,
        'estimatedHours': estimatedHours,
        'estimatedMinutes': estimatedMinutes,
        'tripType': tripType,
        'stops': stops,
        'ticketType': ticketType,
        'flightCategory': flightCategory,
        'flexibility': flexibility,
        'hostName': hostName,
        'aboutAgency': aboutAgency,
        'phoneNumber': phoneNumber,
        'price': price,
        'discount': discount,
        'agreeCancel': agreeCancel,
        'approvalStatus': approvalStatus,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'flightImageID': flightImageId,
        'flightPic1': flightPic1,
        'flightPic2': flightPic2,
      };

  @override
  List<Object?> get props {
    return [
      flightId,
      hostId,
      fromWhere,
      toWhere,
      departure,
      arrival,
      estimatedHours,
      estimatedMinutes,
      tripType,
      stops,
      ticketType,
      flightCategory,
      flexibility,
      hostName,
      aboutAgency,
      phoneNumber,
      price,
      discount,
      agreeCancel,
      approvalStatus,
      createdAt,
      updatedAt,
      flightImageId,
      flightPic1,
      flightPic2,
    ];
  }
}

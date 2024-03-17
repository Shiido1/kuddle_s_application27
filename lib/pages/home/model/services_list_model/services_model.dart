import 'package:equatable/equatable.dart';

class ServicesModel extends Equatable {
  final int? serviceId;
  final int? hostId;
  final String? serviceName;
  final String? serviceType;
  final String? country;
  final String? stateProvince;
  final String? city;
  final String? zipCode;
  final String? streetAddress;
  final String? aboutService;
  final String? hostName;
  final String? aboutHost;
  final String? phoneNumber;
  final int? approvalStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? serviceFeaturesId;
  final String? checkInFrom;
  final String? checkInUntil;
  final String? checkOutFrom;
  final String? checkOutUntil;
  final String? price;
  final String? discount;
  final String? agreeCancel;
  final int? serviceImageId;
  final String? servicePic1;
  final String? servicePic2;
  final String? servicePic3;
  final String? servicePic4;
  final String? servicePic5;

  const ServicesModel({
    this.serviceId,
    this.hostId,
    this.serviceName,
    this.serviceType,
    this.country,
    this.stateProvince,
    this.city,
    this.zipCode,
    this.streetAddress,
    this.aboutService,
    this.hostName,
    this.aboutHost,
    this.phoneNumber,
    this.approvalStatus,
    this.createdAt,
    this.updatedAt,
    this.serviceFeaturesId,
    this.checkInFrom,
    this.checkInUntil,
    this.checkOutFrom,
    this.checkOutUntil,
    this.price,
    this.discount,
    this.agreeCancel,
    this.serviceImageId,
    this.servicePic1,
    this.servicePic2,
    this.servicePic3,
    this.servicePic4,
    this.servicePic5,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        serviceId: json['serviceID'] as int?,
        hostId: json['hostID'] as int?,
        serviceName: json['serviceName'] as String?,
        serviceType: json['serviceType'] as String?,
        country: json['country'] as String?,
        stateProvince: json['stateProvince'] as String?,
        city: json['city'] as String?,
        zipCode: json['zipCode'] as String?,
        streetAddress: json['streetAddress'] as String?,
        aboutService: json['aboutService'] as String?,
        hostName: json['hostName'] as String?,
        aboutHost: json['aboutHost'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        approvalStatus: json['approvalStatus'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        serviceFeaturesId: json['serviceFeaturesID'] as int?,
        checkInFrom: json['checkInFrom'] as String?,
        checkInUntil: json['checkInUntil'] as String?,
        checkOutFrom: json['checkOutFrom'] as String?,
        checkOutUntil: json['checkOutUntil'] as String?,
        price: json['price'] as String?,
        discount: json['discount'] as String?,
        agreeCancel: json['agreeCancel'] as String?,
        serviceImageId: json['serviceImageID'] as int?,
        servicePic1: json['servicePic1'] as String?,
        servicePic2: json['servicePic2'] as String?,
        servicePic3: json['servicePic3'] as String?,
        servicePic4: json['servicePic4'] as String?,
        servicePic5: json['servicePic5'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'serviceID': serviceId,
        'hostID': hostId,
        'serviceName': serviceName,
        'serviceType': serviceType,
        'country': country,
        'stateProvince': stateProvince,
        'city': city,
        'zipCode': zipCode,
        'streetAddress': streetAddress,
        'aboutService': aboutService,
        'hostName': hostName,
        'aboutHost': aboutHost,
        'phoneNumber': phoneNumber,
        'approvalStatus': approvalStatus,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'serviceFeaturesID': serviceFeaturesId,
        'checkInFrom': checkInFrom,
        'checkInUntil': checkInUntil,
        'checkOutFrom': checkOutFrom,
        'checkOutUntil': checkOutUntil,
        'price': price,
        'discount': discount,
        'agreeCancel': agreeCancel,
        'serviceImageID': serviceImageId,
        'servicePic1': servicePic1,
        'servicePic2': servicePic2,
        'servicePic3': servicePic3,
        'servicePic4': servicePic4,
        'servicePic5': servicePic5,
      };

  @override
  List<Object?> get props {
    return [
      serviceId,
      hostId,
      serviceName,
      serviceType,
      country,
      stateProvince,
      city,
      zipCode,
      streetAddress,
      aboutService,
      hostName,
      aboutHost,
      phoneNumber,
      approvalStatus,
      createdAt,
      updatedAt,
      serviceFeaturesId,
      checkInFrom,
      checkInUntil,
      checkOutFrom,
      checkOutUntil,
      price,
      discount,
      agreeCancel,
      serviceImageId,
      servicePic1,
      servicePic2,
      servicePic3,
      servicePic4,
      servicePic5,
    ];
  }
}

import 'package:equatable/equatable.dart';

class OtherServicesModel extends Equatable {
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

  const OtherServicesModel({
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

  factory OtherServicesModel.fromJson(Map<String, dynamic> json) =>
      OtherServicesModel(
        serviceId: json["serviceID"],
        hostId: json["hostID"],
        serviceName: json["serviceName"],
        serviceType: json["serviceType"],
        country: json["country"],
        stateProvince: json["stateProvince"],
        city: json["city"],
        zipCode: json["zipCode"],
        streetAddress: json["streetAddress"],
        aboutService: json["aboutService"],
        hostName: json["hostName"],
        aboutHost: json["aboutHost"],
        phoneNumber: json["phoneNumber"],
        approvalStatus: json["approvalStatus"],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
        serviceFeaturesId: json["serviceFeaturesID"],
        checkInFrom: json["checkInFrom"],
        checkInUntil: json["checkInUntil"],
        checkOutFrom: json["checkOutFrom"],
        checkOutUntil: json["checkOutUntil"],
        price: json["price"],
        discount: json["discount"],
        agreeCancel: json["agreeCancel"],
        serviceImageId: json["serviceImageID"],
        servicePic1: json["servicePic1"],
        servicePic2: json["servicePic2"],
        servicePic3: json["servicePic3"],
        servicePic4: json["servicePic4"],
        servicePic5: json["servicePic5"],
      );

  Map<String, dynamic> toJson() => {
        "serviceID": serviceId,
        "hostID": hostId,
        "serviceName": serviceName,
        "serviceType": serviceType,
        "country": country,
        "stateProvince": stateProvince,
        "city": city,
        "zipCode": zipCode,
        "streetAddress": streetAddress,
        "aboutService": aboutService,
        "hostName": hostName,
        "aboutHost": aboutHost,
        "phoneNumber": phoneNumber,
        "approvalStatus": approvalStatus,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "serviceFeaturesID": serviceFeaturesId,
        "checkInFrom": checkInFrom,
        "checkInUntil": checkInUntil,
        "checkOutFrom": checkOutFrom,
        "checkOutUntil": checkOutUntil,
        "price": price,
        "discount": discount,
        "agreeCancel": agreeCancel,
        "serviceImageID": serviceImageId,
        "servicePic1": servicePic1,
        "servicePic2": servicePic2,
        "servicePic3": servicePic3,
        "servicePic4": servicePic4,
        "servicePic5": servicePic5,
      };

  @override
  List<Object?> get props {
    return [
      servicePic5,
      servicePic4,
      servicePic3,
      servicePic2,
      servicePic1,
      serviceImageId,
      hostId,
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
      createdAt?.toIso8601String(),
      updatedAt?.toIso8601String(),
      serviceFeaturesId,
      checkInFrom,
      checkInUntil,
      checkOutFrom,
      checkOutUntil,
      price,
      discount,
      agreeCancel,
    ];
  }
}

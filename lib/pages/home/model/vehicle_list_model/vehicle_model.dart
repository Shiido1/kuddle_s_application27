import 'package:equatable/equatable.dart';

class VehicleModel extends Equatable {
  final int? vehicleId;
  final int? hostId;
  final String? vehicleName;
  final String? vehicleModel;
  final String? vehicleNo;
  final String? city;
  final String? zipCode;
  final String? stateProvince;
  final String? country;
  final String? streetAddress;
  final String? aboutVehicle;
  final String? hostName;
  final String? aboutHost;
  final String? phoneNumber;
  final int? approvalStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? vehicleFeaturesId;
  final String? vehicleClass;
  final String? fuelType;
  final String? transmission;
  final String? engineSize;
  final String? enginePower;
  final String? fuelConsumption;
  final String? seats;
  final String? doors;
  final String? airConditioner;
  final String? availability;
  final String? pickUpFrom;
  final String? pickUpUntil;
  final String? dropOffFrom;
  final String? dropOffUntil;
  final String? price;
  final String? discount;
  final String? agreeCancel;
  final int? vehicleImageId;
  final String? bookedDates;
  final String? vehiclePic1;
  final String? vehiclePic2;
  final String? vehiclePic3;
  final String? vehiclePic4;
  final String? vehiclePic5;

  const VehicleModel({
    this.vehicleId,
    this.hostId,
    this.vehicleName,
    this.vehicleModel,
    this.vehicleNo,
    this.city,
    this.zipCode,
    this.stateProvince,
    this.country,
    this.streetAddress,
    this.aboutVehicle,
    this.hostName,
    this.aboutHost,
    this.phoneNumber,
    this.approvalStatus,
    this.createdAt,
    this.updatedAt,
    this.vehicleFeaturesId,
    this.vehicleClass,
    this.fuelType,
    this.transmission,
    this.engineSize,
    this.enginePower,
    this.fuelConsumption,
    this.seats,
    this.doors,
    this.airConditioner,
    this.availability,
    this.pickUpFrom,
    this.pickUpUntil,
    this.dropOffFrom,
    this.dropOffUntil,
    this.price,
    this.discount,
    this.agreeCancel,
    this.vehicleImageId,
    this.bookedDates,
    this.vehiclePic1,
    this.vehiclePic2,
    this.vehiclePic3,
    this.vehiclePic4,
    this.vehiclePic5,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        vehicleId: json['vehicleID'] as int?,
        hostId: json['hostID'] as int?,
        vehicleName: json['vehicleName'] as String?,
        vehicleModel: json['vehicleModel'] as String?,
        vehicleNo: json['vehicleNo'] as String?,
        city: json['city'] as String?,
        zipCode: json['zipCode'] as String?,
        stateProvince: json['stateProvince'] as String?,
        country: json['country'] as String?,
        streetAddress: json['streetAddress'] as String?,
        aboutVehicle: json['aboutVehicle'] as String?,
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
        vehicleFeaturesId: json['vehicleFeaturesID'] as int?,
        vehicleClass: json['vehicleClass'] as String?,
        fuelType: json['fuelType'] as String?,
        transmission: json['transmission'] as String?,
        engineSize: json['engineSize'] as String?,
        enginePower: json['enginePower'] as String?,
        fuelConsumption: json['fuelConsumption'] as String?,
        seats: json['seats'] as String?,
        doors: json['doors'] as String?,
        airConditioner: json['airConditioner'] as String?,
        availability: json['availability'] as String?,
        pickUpFrom: json['pickUpFrom'] as String?,
        pickUpUntil: json['pickUpUntil'] as String?,
        dropOffFrom: json['dropOffFrom'] as String?,
        dropOffUntil: json['dropOffUntil'] as String?,
        price: json['price'] as String?,
        discount: json['discount'] as String?,
        agreeCancel: json['agreeCancel'] as String?,
        vehicleImageId: json['vehicleImageID'] as int?,
        vehiclePic1: json['vehiclePic1'] as String?,
        bookedDates: json['bookedDates'] as String,
        vehiclePic2: json['vehiclePic2'] as String?,
        vehiclePic3: json['vehiclePic3'] as String?,
        vehiclePic4: json['vehiclePic4'] as String?,
        vehiclePic5: json['vehiclePic5'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'vehicleID': vehicleId,
        'hostID': hostId,
        'vehicleName': vehicleName,
        'vehicleModel': vehicleModel,
        'vehicleNo': vehicleNo,
        'city': city,
        'zipCode': zipCode,
        'stateProvince': stateProvince,
        'country': country,
        'streetAddress': streetAddress,
        'aboutVehicle': aboutVehicle,
        'hostName': hostName,
        'aboutHost': aboutHost,
        'phoneNumber': phoneNumber,
        'approvalStatus': approvalStatus,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'vehicleFeaturesID': vehicleFeaturesId,
        'vehicleClass': vehicleClass,
        'fuelType': fuelType,
        'transmission': transmission,
        'engineSize': engineSize,
        'enginePower': enginePower,
        'fuelConsumption': fuelConsumption,
        'seats': seats,
        'doors': doors,
        'airConditioner': airConditioner,
        'availability': availability,
        'pickUpFrom': pickUpFrom,
        'pickUpUntil': pickUpUntil,
        'dropOffFrom': dropOffFrom,
        'dropOffUntil': dropOffUntil,
        'price': price,
        'discount': discount,
        'agreeCancel': agreeCancel,
        'vehicleImageID': vehicleImageId,
        'bookedDates': bookedDates,
        'vehiclePic1': vehiclePic1,
        'vehiclePic2': vehiclePic2,
        'vehiclePic3': vehiclePic3,
        'vehiclePic4': vehiclePic4,
        'vehiclePic5': vehiclePic5,
      };

  VehicleModel copyWith({
    int? vehicleId,
    int? hostId,
    String? vehicleName,
    String? vehicleModel,
    String? vehicleNo,
    String? city,
    String? zipCode,
    String? stateProvince,
    String? country,
    String? streetAddress,
    String? aboutVehicle,
    String? hostName,
    String? aboutHost,
    String? phoneNumber,
    int? approvalStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? vehicleFeaturesId,
    String? vehicleClass,
    String? fuelType,
    String? transmission,
    String? engineSize,
    String? enginePower,
    String? fuelConsumption,
    String? seats,
    String? doors,
    String? airConditioner,
    String? availability,
    String? pickUpFrom,
    String? pickUpUntil,
    String? dropOffFrom,
    String? dropOffUntil,
    String? price,
    String? discount,
    String? agreeCancel,
    int? vehicleImageId,
    String? vehiclePic1,
    String? vehiclePic2,
    String? vehiclePic3,
    String? vehiclePic4,
    String? vehiclePic5,
  }) {
    return VehicleModel(
      vehicleId: vehicleId ?? this.vehicleId,
      hostId: hostId ?? this.hostId,
      vehicleName: vehicleName ?? this.vehicleName,
      vehicleModel: vehicleModel ?? this.vehicleModel,
      vehicleNo: vehicleNo ?? this.vehicleNo,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      stateProvince: stateProvince ?? this.stateProvince,
      country: country ?? this.country,
      streetAddress: streetAddress ?? this.streetAddress,
      aboutVehicle: aboutVehicle ?? this.aboutVehicle,
      hostName: hostName ?? this.hostName,
      aboutHost: aboutHost ?? this.aboutHost,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      approvalStatus: approvalStatus ?? this.approvalStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      vehicleFeaturesId: vehicleFeaturesId ?? this.vehicleFeaturesId,
      vehicleClass: vehicleClass ?? this.vehicleClass,
      fuelType: fuelType ?? this.fuelType,
      transmission: transmission ?? this.transmission,
      engineSize: engineSize ?? this.engineSize,
      enginePower: enginePower ?? this.enginePower,
      fuelConsumption: fuelConsumption ?? this.fuelConsumption,
      seats: seats ?? this.seats,
      doors: doors ?? this.doors,
      airConditioner: airConditioner ?? this.airConditioner,
      availability: availability ?? this.availability,
      pickUpFrom: pickUpFrom ?? this.pickUpFrom,
      pickUpUntil: pickUpUntil ?? this.pickUpUntil,
      dropOffFrom: dropOffFrom ?? this.dropOffFrom,
      dropOffUntil: dropOffUntil ?? this.dropOffUntil,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      agreeCancel: agreeCancel ?? this.agreeCancel,
      vehicleImageId: vehicleImageId ?? this.vehicleImageId,
      vehiclePic1: vehiclePic1 ?? this.vehiclePic1,
      vehiclePic2: vehiclePic2 ?? this.vehiclePic2,
      vehiclePic3: vehiclePic3 ?? this.vehiclePic3,
      vehiclePic4: vehiclePic4 ?? this.vehiclePic4,
      vehiclePic5: vehiclePic5 ?? this.vehiclePic5,
    );
  }

  @override
  List<Object?> get props {
    return [
      vehicleId,
      hostId,
      vehicleName,
      vehicleModel,
      vehicleNo,
      city,
      zipCode,
      stateProvince,
      country,
      streetAddress,
      aboutVehicle,
      hostName,
      aboutHost,
      phoneNumber,
      approvalStatus,
      createdAt,
      updatedAt,
      vehicleFeaturesId,
      vehicleClass,
      fuelType,
      transmission,
      engineSize,
      enginePower,
      fuelConsumption,
      seats,
      doors,
      airConditioner,
      availability,
      pickUpFrom,
      pickUpUntil,
      dropOffFrom,
      dropOffUntil,
      price,
      discount,
      agreeCancel,
      vehicleImageId,
      vehiclePic1,
      vehiclePic2,
      vehiclePic3,
      vehiclePic4,
      vehiclePic5,
    ];
  }
}

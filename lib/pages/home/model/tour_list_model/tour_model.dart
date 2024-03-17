import 'package:equatable/equatable.dart';

class TourModel extends Equatable {
  final int? tourId;
  final int? hostId;
  final String? tourName;
  final String? tourType;
  final String? country;
  final String? stateProvince;
  final String? city;
  final String? zipCode;
  final String? streetAddress;
  final String? aboutTourCenter;
  final String? hostName;
  final String? aboutHost;
  final String? phoneNumber;
  final String? aboutNeighborhood;
  final int? approvalStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? tourFeaturesId;
  final String? smoking;
  final String? pet;
  final String? children;
  final String? checkInFrom;
  final String? checkInUntil;
  final String? checkOutFrom;
  final String? checkOutUntil;
  final String? price;
  final String? discount;
  final String? agreeCancel;
  final int? tourImageId;
  final String? tourPic1;
  final String? tourPic2;
  final String? tourPic3;
  final String? tourPic4;
  final String? tourPic5;

  const TourModel({
    this.tourId,
    this.hostId,
    this.tourName,
    this.tourType,
    this.country,
    this.stateProvince,
    this.city,
    this.zipCode,
    this.streetAddress,
    this.aboutTourCenter,
    this.hostName,
    this.aboutHost,
    this.phoneNumber,
    this.aboutNeighborhood,
    this.approvalStatus,
    this.createdAt,
    this.updatedAt,
    this.tourFeaturesId,
    this.smoking,
    this.pet,
    this.children,
    this.checkInFrom,
    this.checkInUntil,
    this.checkOutFrom,
    this.checkOutUntil,
    this.price,
    this.discount,
    this.agreeCancel,
    this.tourImageId,
    this.tourPic1,
    this.tourPic2,
    this.tourPic3,
    this.tourPic4,
    this.tourPic5,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) => TourModel(
        tourId: json['tourID'] as int?,
        hostId: json['hostID'] as int?,
        tourName: json['tourName'] as String?,
        tourType: json['tourType'] as String?,
        country: json['country'] as String?,
        stateProvince: json['stateProvince'] as String?,
        city: json['city'] as String?,
        zipCode: json['zipCode'] as String?,
        streetAddress: json['streetAddress'] as String?,
        aboutTourCenter: json['aboutTourCenter'] as String?,
        hostName: json['hostName'] as String?,
        aboutHost: json['aboutHost'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        aboutNeighborhood: json['aboutNeighborhood'] as String?,
        approvalStatus: json['approvalStatus'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        tourFeaturesId: json['tourFeaturesID'] as int?,
        smoking: json['smoking'] as String?,
        pet: json['pet'] as String?,
        children: json['children'] as String?,
        checkInFrom: json['checkInFrom'] as String?,
        checkInUntil: json['checkInUntil'] as String?,
        checkOutFrom: json['checkOutFrom'] as String?,
        checkOutUntil: json['checkOutUntil'] as String?,
        price: json['price'] as String?,
        discount: json['discount'] as String?,
        agreeCancel: json['agreeCancel'] as String?,
        tourImageId: json['tourImageID'] as int?,
        tourPic1: json['tourPic1'] as String?,
        tourPic2: json['tourPic2'] as String?,
        tourPic3: json['tourPic3'] as String?,
        tourPic4: json['tourPic4'] as String?,
        tourPic5: json['tourPic5'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tourID': tourId,
        'hostID': hostId,
        'tourName': tourName,
        'tourType': tourType,
        'country': country,
        'stateProvince': stateProvince,
        'city': city,
        'zipCode': zipCode,
        'streetAddress': streetAddress,
        'aboutTourCenter': aboutTourCenter,
        'hostName': hostName,
        'aboutHost': aboutHost,
        'phoneNumber': phoneNumber,
        'aboutNeighborhood': aboutNeighborhood,
        'approvalStatus': approvalStatus,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'tourFeaturesID': tourFeaturesId,
        'smoking': smoking,
        'pet': pet,
        'children': children,
        'checkInFrom': checkInFrom,
        'checkInUntil': checkInUntil,
        'checkOutFrom': checkOutFrom,
        'checkOutUntil': checkOutUntil,
        'price': price,
        'discount': discount,
        'agreeCancel': agreeCancel,
        'tourImageID': tourImageId,
        'tourPic1': tourPic1,
        'tourPic2': tourPic2,
        'tourPic3': tourPic3,
        'tourPic4': tourPic4,
        'tourPic5': tourPic5,
      };

  @override
  List<Object?> get props {
    return [
      tourId,
      hostId,
      tourName,
      tourType,
      country,
      stateProvince,
      city,
      zipCode,
      streetAddress,
      aboutTourCenter,
      hostName,
      aboutHost,
      phoneNumber,
      aboutNeighborhood,
      approvalStatus,
      createdAt,
      updatedAt,
      tourFeaturesId,
      smoking,
      pet,
      children,
      checkInFrom,
      checkInUntil,
      checkOutFrom,
      checkOutUntil,
      price,
      discount,
      agreeCancel,
      tourImageId,
      tourPic1,
      tourPic2,
      tourPic3,
      tourPic4,
      tourPic5,
    ];
  }
}

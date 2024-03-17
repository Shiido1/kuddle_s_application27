import 'package:equatable/equatable.dart';

class PropertyModel extends Equatable {
  final int? propertyId;
  final int? hostId;
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
  final String? price;
  final String? discount;
  final String? agreeCancel;
  final int? approvalStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? roomId;
  final int? roomNo;
  final int? guestNo;
  final int? bathroomNo;
  final String? roomBedType;
  final String? available;
  final int? featuresId;
  final String? bar;
  final String? wifi;
  final String? grill;
  final String? airConditioner;
  final String? flatScreenTv;
  final String? fitnessCenter;
  final String? kitchen;
  final String? garden;
  final String? pool;
  final String? breakfast;
  final String? parking;
  final String? jacuzzi;
  final String? heating;
  final String? washingMachine;
  final int? propertyImageId;
  final String? propertyPic1;
  final String? propertyPic2;
  final String? propertyPic3;
  final String? propertyPic4;
  final String? propertyPic5;

  const PropertyModel({
    this.propertyId,
    this.hostId,
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
    this.price,
    this.discount,
    this.agreeCancel,
    this.approvalStatus,
    this.createdAt,
    this.updatedAt,
    this.roomId,
    this.roomNo,
    this.guestNo,
    this.bathroomNo,
    this.roomBedType,
    this.available,
    this.featuresId,
    this.bar,
    this.wifi,
    this.grill,
    this.airConditioner,
    this.flatScreenTv,
    this.fitnessCenter,
    this.kitchen,
    this.garden,
    this.pool,
    this.breakfast,
    this.parking,
    this.jacuzzi,
    this.heating,
    this.washingMachine,
    this.propertyImageId,
    this.propertyPic1,
    this.propertyPic2,
    this.propertyPic3,
    this.propertyPic4,
    this.propertyPic5,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        propertyId: json['propertyID'] as int?,
        hostId: json['hostID'] as int?,
        propertyName: json['propertyName'] as String?,
        propertyType: json['propertyType'] as String?,
        city: json['city'] as String?,
        zipCode: json['zipCode'] as String?,
        stateProvince: json['stateProvince'] as String?,
        country: json['country'] as String?,
        streetAddress: json['streetAddress'] as String?,
        aboutProperty: json['aboutProperty'] as String?,
        hostName: json['hostName'] as String?,
        aboutHost: json['aboutHost'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        aboutNeighborhood: json['aboutNeighborhood'] as String?,
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
        roomId: json['roomID'] as int?,
        roomNo: json['roomNo'] as int?,
        guestNo: json['guestNo'] as int?,
        bathroomNo: json['bathroomNo'] as int?,
        roomBedType: json['roomBedType'] as String?,
        available: json['available'] as String?,
        featuresId: json['featuresID'] as int?,
        bar: json['bar'] as String?,
        wifi: json['wifi'] as String?,
        grill: json['grill'] as String?,
        airConditioner: json['airConditioner'] as String?,
        flatScreenTv: json['flatScreenTv'] as String?,
        fitnessCenter: json['fitnessCenter'] as String?,
        kitchen: json['kitchen'] as String?,
        garden: json['garden'] as String?,
        pool: json['pool'] as String?,
        breakfast: json['breakfast'] as String?,
        parking: json['parking'] as String?,
        jacuzzi: json['jacuzzi'] as String?,
        heating: json['heating'] as String?,
        washingMachine: json['washingMachine'] as String?,
        propertyImageId: json['propertyImageID'] as int?,
        propertyPic1: json['propertyPic1'] as String?,
        propertyPic2: json['propertyPic2'] as String?,
        propertyPic3: json['propertyPic3'] as String?,
        propertyPic4: json['propertyPic4'] as String?,
        propertyPic5: json['propertyPic5'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'propertyID': propertyId,
        'hostID': hostId,
        'propertyName': propertyName,
        'propertyType': propertyType,
        'city': city,
        'zipCode': zipCode,
        'stateProvince': stateProvince,
        'country': country,
        'streetAddress': streetAddress,
        'aboutProperty': aboutProperty,
        'hostName': hostName,
        'aboutHost': aboutHost,
        'phoneNumber': phoneNumber,
        'aboutNeighborhood': aboutNeighborhood,
        'price': price,
        'discount': discount,
        'agreeCancel': agreeCancel,
        'approvalStatus': approvalStatus,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'roomID': roomId,
        'roomNo': roomNo,
        'guestNo': guestNo,
        'bathroomNo': bathroomNo,
        'roomBedType': roomBedType,
        'available': available,
        'featuresID': featuresId,
        'bar': bar,
        'wifi': wifi,
        'grill': grill,
        'airConditioner': airConditioner,
        'flatScreenTv': flatScreenTv,
        'fitnessCenter': fitnessCenter,
        'kitchen': kitchen,
        'garden': garden,
        'pool': pool,
        'breakfast': breakfast,
        'parking': parking,
        'jacuzzi': jacuzzi,
        'heating': heating,
        'washingMachine': washingMachine,
        'propertyImageID': propertyImageId,
        'propertyPic1': propertyPic1,
        'propertyPic2': propertyPic2,
        'propertyPic3': propertyPic3,
        'propertyPic4': propertyPic4,
        'propertyPic5': propertyPic5,
      };

  @override
  List<Object?> get props {
    return [
      propertyId,
      hostId,
      propertyName,
      propertyType,
      city,
      zipCode,
      stateProvince,
      country,
      streetAddress,
      aboutProperty,
      hostName,
      aboutHost,
      phoneNumber,
      aboutNeighborhood,
      price,
      discount,
      agreeCancel,
      approvalStatus,
      createdAt,
      updatedAt,
      roomId,
      roomNo,
      guestNo,
      bathroomNo,
      roomBedType,
      available,
      featuresId,
      bar,
      wifi,
      grill,
      airConditioner,
      flatScreenTv,
      fitnessCenter,
      kitchen,
      garden,
      pool,
      breakfast,
      parking,
      jacuzzi,
      heating,
      washingMachine,
      propertyImageId,
      propertyPic1,
      propertyPic2,
      propertyPic3,
      propertyPic4,
      propertyPic5,
    ];
  }
}

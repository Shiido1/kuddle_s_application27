import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  final int? userId;
  final String? username;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? emailAddress;
  final String? phoneNumber;
  final dynamic country;
  final dynamic stateProvince;
  final dynamic city;
  final dynamic zipCode;
  final dynamic streetAddress;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? verifyEmail;

  const UserDetails({
    this.userId,
    this.username,
    this.password,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.phoneNumber,
    this.country,
    this.stateProvince,
    this.city,
    this.zipCode,
    this.streetAddress,
    this.createdAt,
    this.updatedAt,
    this.verifyEmail,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        userId: json['userID'] as int?,
        username: json['username'] as String?,
        password: json['password'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        emailAddress: json['emailAddress'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        country: json['country'] as dynamic,
        stateProvince: json['stateProvince'] as dynamic,
        city: json['city'] as dynamic,
        zipCode: json['zipCode'] as dynamic,
        streetAddress: json['streetAddress'] as dynamic,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        verifyEmail: json['verifyEmail'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'userID': userId,
        'username': username,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'emailAddress': emailAddress,
        'phoneNumber': phoneNumber,
        'country': country,
        'stateProvince': stateProvince,
        'city': city,
        'zipCode': zipCode,
        'streetAddress': streetAddress,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'verifyEmail': verifyEmail,
      };

  @override
  List<Object?> get props {
    return [
      userId,
      username,
      password,
      firstName,
      lastName,
      emailAddress,
      phoneNumber,
      country,
      stateProvince,
      city,
      zipCode,
      streetAddress,
      createdAt,
      updatedAt,
      verifyEmail,
    ];
  }
}

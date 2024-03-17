import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? emailAddress;
  final String? phoneNumber;
  final String? username;
  final String? password;

  const RegisterModel({
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.phoneNumber,
    this.username,
    this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        emailAddress: json['emailAddress'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        username: json['username'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'emailAddress': emailAddress,
        'phoneNumber': phoneNumber,
        'username': username,
        'password': password,
      };

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      emailAddress,
      phoneNumber,
      username,
      password,
    ];
  }
}

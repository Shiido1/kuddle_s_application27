import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String? emailAddress;
  final String? password;

  const LoginModel({this.emailAddress, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        emailAddress: json['emailAddress'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'emailAddress': emailAddress,
        'password': password,
      };

  @override
  List<Object?> get props => [emailAddress, password];
}

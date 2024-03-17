import 'package:equatable/equatable.dart';

import 'user_details.dart';

class UserReponse extends Equatable {
  final String? status;
  final List<UserDetails>? result;

  const UserReponse({this.status, this.result});

  factory UserReponse.fromJson(Map<String, dynamic> json) => UserReponse(
        status: json['status'] as String?,
        result: (json['Result'] as List<dynamic>?)
            ?.map((e) => UserDetails.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'Result': result?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, result];
}

import 'package:equatable/equatable.dart';

import 'services_model.dart';

class ServicesListModel extends Equatable {
  final String? status;
  final List<ServicesModel>? result;

  const ServicesListModel({this.status, this.result});

  factory ServicesListModel.fromJson(Map<String, dynamic> json) {
    return ServicesListModel(
      status: json['status'] as String?,
      result: (json['Result'] as List<dynamic>?)
          ?.map((e) => ServicesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'Result': result?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, result];
}

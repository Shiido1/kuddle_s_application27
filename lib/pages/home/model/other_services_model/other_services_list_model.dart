// import 'package:bookanow_app/presentation/pages/home/model/other_services_model/other_services_model.dart';
import 'package:equatable/equatable.dart';

import 'other_services_model.dart';

class OtherServicesListModel extends Equatable {
  final String? status;
  final List<OtherServicesModel>? result;

  const OtherServicesListModel({this.status, this.result});

  factory OtherServicesListModel.fromJson(Map<String, dynamic> json) {
    return OtherServicesListModel(
      status: json['status'] as String?,
      result: (json['Result'] as List<dynamic>?)
          ?.map((e) => OtherServicesModel.fromJson(e as Map<String, dynamic>))
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

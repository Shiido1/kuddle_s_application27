import 'package:equatable/equatable.dart';

import 'vehicle_model.dart';

class VehicleListModel extends Equatable {
  final String? status;
  final List<VehicleModel>? result;

  const VehicleListModel({this.status, this.result});

  factory VehicleListModel.fromJson(Map<String, dynamic> json) {
    return VehicleListModel(
      status: json['status'] as String?,
      result: (json['Result'] as List<dynamic>?)
          ?.map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'Result': result?.map((e) => e.toJson()).toList(),
      };

  VehicleListModel copyWith({
    String? status,
    List<VehicleModel>? result,
  }) {
    return VehicleListModel(
      status: status ?? this.status,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [status, result];
}

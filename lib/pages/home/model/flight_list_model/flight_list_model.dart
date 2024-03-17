import 'package:equatable/equatable.dart';

import 'flight_model.dart';

class FlightListModel extends Equatable {
  final String? status;
  final List<FlightModel>? result;

  const FlightListModel({this.status, this.result});

  factory FlightListModel.fromJson(Map<String, dynamic> json) {
    return FlightListModel(
      status: json['status'] as String?,
      result: (json['Result'] as List<dynamic>?)
          ?.map((e) => FlightModel.fromJson(e as Map<String, dynamic>))
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

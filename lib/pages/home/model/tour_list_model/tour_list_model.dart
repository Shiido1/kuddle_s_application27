import 'package:equatable/equatable.dart';

import 'tour_model.dart';

class TourListModel extends Equatable {
  final String? status;
  final List<TourModel>? result;

  const TourListModel({this.status, this.result});

  factory TourListModel.fromJson(Map<String, dynamic> json) => TourListModel(
        status: json['status'] as String?,
        result: (json['Result'] as List<dynamic>?)
            ?.map((e) => TourModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'Result': result?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, result];
}

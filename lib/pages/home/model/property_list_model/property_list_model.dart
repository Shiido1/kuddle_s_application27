import 'package:equatable/equatable.dart';

import 'property_model.dart';

class PropertyListModel extends Equatable {
  final String? status;
  final List<PropertyModel>? result;

  const PropertyListModel({this.status, this.result});

  factory PropertyListModel.fromJson(Map<String, dynamic> json) {
    return PropertyListModel(
      status: json['status'] as String?,
      result: (json['Result'] as List<dynamic>?)
          ?.map((e) => PropertyModel.fromJson(e as Map<String, dynamic>))
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

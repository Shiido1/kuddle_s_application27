import 'package:equatable/equatable.dart';

import 'booking_model.dart';

class BookingListModel extends Equatable {
  final String? status;
  final int? page;
  final int? count;
  final List<BookingModel>? result;

  const BookingListModel({this.status, this.result,this.page, this.count});

  factory BookingListModel.fromJson(Map<String, dynamic> json) {
    return BookingListModel(
      status: json['status'] as String?,
      page: json['page'] as int?,
      count: json['count'] as int?,
      result: (json['Result'] as List<dynamic>?)
          ?.map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
    'status': count,
    'page': page,
        'Result': result?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, result, count, page];
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'restaurant.dart';

part 'detail_model.freezed.dart';
part 'detail_model.g.dart';

@freezed
class DetailModel with _$DetailModel {
  factory DetailModel({
    bool? error,
    String? message,
    Restaurant? restaurant,
  }) = _DetailModel;

  factory DetailModel.fromJson(Map<String, dynamic> json) =>
      _$DetailModelFromJson(json);
}

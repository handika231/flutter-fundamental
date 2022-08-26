import 'package:freezed_annotation/freezed_annotation.dart';

import 'restaurant.dart';

part 'restaurant_detail.freezed.dart';
part 'restaurant_detail.g.dart';

@freezed
class RestaurantDetail with _$RestaurantDetail {
  factory RestaurantDetail({
    bool? error,
    String? message,
    Restaurant? restaurant,
  }) = _RestaurantDetail;

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailFromJson(json);
}

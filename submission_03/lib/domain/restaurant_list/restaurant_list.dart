import 'package:freezed_annotation/freezed_annotation.dart';

import 'restaurant.dart';

part 'restaurant_list.freezed.dart';
part 'restaurant_list.g.dart';

@freezed
class RestaurantList with _$RestaurantList {
  factory RestaurantList({
    bool? error,
    String? message,
    int? count,
    List<Restaurant>? restaurants,
  }) = _RestaurantList;

  factory RestaurantList.fromJson(Map<String, dynamic> json) =>
      _$RestaurantListFromJson(json);
}

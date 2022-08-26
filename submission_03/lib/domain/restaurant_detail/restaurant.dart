import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';
import 'customer_review.dart';
import 'menus.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  factory Restaurant({
    String? id,
    String? name,
    String? description,
    String? city,
    String? address,
    String? pictureId,
    double? rating,
    List<Category>? categories,
    Menus? menus,
    List<CustomerReview>? customerReviews,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

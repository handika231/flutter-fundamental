import 'package:freezed_annotation/freezed_annotation.dart';

import 'drink.dart';
import 'food.dart';

part 'menus.freezed.dart';
part 'menus.g.dart';

@freezed
class Menus with _$Menus {
  factory Menus({
    List<Food>? foods,
    List<Drink>? drinks,
  }) = _Menus;

  factory Menus.fromJson(Map<String, dynamic> json) => _$MenusFromJson(json);
}

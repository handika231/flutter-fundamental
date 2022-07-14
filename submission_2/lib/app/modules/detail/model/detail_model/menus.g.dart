// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Menus _$$_MenusFromJson(Map<String, dynamic> json) => _$_Menus(
      foods: (json['foods'] as List<dynamic>?)
          ?.map((e) => Food.fromJson(e as Map<String, dynamic>))
          .toList(),
      drinks: (json['drinks'] as List<dynamic>?)
          ?.map((e) => Drink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MenusToJson(_$_Menus instance) => <String, dynamic>{
      'foods': instance.foods,
      'drinks': instance.drinks,
    };

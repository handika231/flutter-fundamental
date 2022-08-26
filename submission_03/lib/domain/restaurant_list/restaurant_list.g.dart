// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantList _$$_RestaurantListFromJson(Map<String, dynamic> json) =>
    _$_RestaurantList(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      count: json['count'] as int?,
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RestaurantListToJson(_$_RestaurantList instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'count': instance.count,
      'restaurants': instance.restaurants,
    };

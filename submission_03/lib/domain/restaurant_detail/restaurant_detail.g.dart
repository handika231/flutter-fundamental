// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantDetail _$$_RestaurantDetailFromJson(Map<String, dynamic> json) =>
    _$_RestaurantDetail(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      restaurant: json['restaurant'] == null
          ? null
          : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RestaurantDetailToJson(_$_RestaurantDetail instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'restaurant': instance.restaurant,
    };

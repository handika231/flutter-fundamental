// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurant_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantDetail _$RestaurantDetailFromJson(Map<String, dynamic> json) {
  return _RestaurantDetail.fromJson(json);
}

/// @nodoc
mixin _$RestaurantDetail {
  bool? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Restaurant? get restaurant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantDetailCopyWith<RestaurantDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantDetailCopyWith<$Res> {
  factory $RestaurantDetailCopyWith(
          RestaurantDetail value, $Res Function(RestaurantDetail) then) =
      _$RestaurantDetailCopyWithImpl<$Res>;
  $Res call({bool? error, String? message, Restaurant? restaurant});

  $RestaurantCopyWith<$Res>? get restaurant;
}

/// @nodoc
class _$RestaurantDetailCopyWithImpl<$Res>
    implements $RestaurantDetailCopyWith<$Res> {
  _$RestaurantDetailCopyWithImpl(this._value, this._then);

  final RestaurantDetail _value;
  // ignore: unused_field
  final $Res Function(RestaurantDetail) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? restaurant = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurant: restaurant == freezed
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant?,
    ));
  }

  @override
  $RestaurantCopyWith<$Res>? get restaurant {
    if (_value.restaurant == null) {
      return null;
    }

    return $RestaurantCopyWith<$Res>(_value.restaurant!, (value) {
      return _then(_value.copyWith(restaurant: value));
    });
  }
}

/// @nodoc
abstract class _$$_RestaurantDetailCopyWith<$Res>
    implements $RestaurantDetailCopyWith<$Res> {
  factory _$$_RestaurantDetailCopyWith(
          _$_RestaurantDetail value, $Res Function(_$_RestaurantDetail) then) =
      __$$_RestaurantDetailCopyWithImpl<$Res>;
  @override
  $Res call({bool? error, String? message, Restaurant? restaurant});

  @override
  $RestaurantCopyWith<$Res>? get restaurant;
}

/// @nodoc
class __$$_RestaurantDetailCopyWithImpl<$Res>
    extends _$RestaurantDetailCopyWithImpl<$Res>
    implements _$$_RestaurantDetailCopyWith<$Res> {
  __$$_RestaurantDetailCopyWithImpl(
      _$_RestaurantDetail _value, $Res Function(_$_RestaurantDetail) _then)
      : super(_value, (v) => _then(v as _$_RestaurantDetail));

  @override
  _$_RestaurantDetail get _value => super._value as _$_RestaurantDetail;

  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? restaurant = freezed,
  }) {
    return _then(_$_RestaurantDetail(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurant: restaurant == freezed
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RestaurantDetail implements _RestaurantDetail {
  _$_RestaurantDetail({this.error, this.message, this.restaurant});

  factory _$_RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantDetailFromJson(json);

  @override
  final bool? error;
  @override
  final String? message;
  @override
  final Restaurant? restaurant;

  @override
  String toString() {
    return 'RestaurantDetail(error: $error, message: $message, restaurant: $restaurant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantDetail &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.restaurant, restaurant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(restaurant));

  @JsonKey(ignore: true)
  @override
  _$$_RestaurantDetailCopyWith<_$_RestaurantDetail> get copyWith =>
      __$$_RestaurantDetailCopyWithImpl<_$_RestaurantDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantDetailToJson(
      this,
    );
  }
}

abstract class _RestaurantDetail implements RestaurantDetail {
  factory _RestaurantDetail(
      {final bool? error,
      final String? message,
      final Restaurant? restaurant}) = _$_RestaurantDetail;

  factory _RestaurantDetail.fromJson(Map<String, dynamic> json) =
      _$_RestaurantDetail.fromJson;

  @override
  bool? get error;
  @override
  String? get message;
  @override
  Restaurant? get restaurant;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantDetailCopyWith<_$_RestaurantDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

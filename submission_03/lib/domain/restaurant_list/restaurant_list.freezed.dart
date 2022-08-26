// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurant_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantList _$RestaurantListFromJson(Map<String, dynamic> json) {
  return _RestaurantList.fromJson(json);
}

/// @nodoc
mixin _$RestaurantList {
  bool? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  List<Restaurant>? get restaurants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantListCopyWith<RestaurantList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantListCopyWith<$Res> {
  factory $RestaurantListCopyWith(
          RestaurantList value, $Res Function(RestaurantList) then) =
      _$RestaurantListCopyWithImpl<$Res>;
  $Res call(
      {bool? error,
      String? message,
      int? count,
      List<Restaurant>? restaurants});
}

/// @nodoc
class _$RestaurantListCopyWithImpl<$Res>
    implements $RestaurantListCopyWith<$Res> {
  _$RestaurantListCopyWithImpl(this._value, this._then);

  final RestaurantList _value;
  // ignore: unused_field
  final $Res Function(RestaurantList) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? count = freezed,
    Object? restaurants = freezed,
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
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      restaurants: restaurants == freezed
          ? _value.restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>?,
    ));
  }
}

/// @nodoc
abstract class _$$_RestaurantListCopyWith<$Res>
    implements $RestaurantListCopyWith<$Res> {
  factory _$$_RestaurantListCopyWith(
          _$_RestaurantList value, $Res Function(_$_RestaurantList) then) =
      __$$_RestaurantListCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? error,
      String? message,
      int? count,
      List<Restaurant>? restaurants});
}

/// @nodoc
class __$$_RestaurantListCopyWithImpl<$Res>
    extends _$RestaurantListCopyWithImpl<$Res>
    implements _$$_RestaurantListCopyWith<$Res> {
  __$$_RestaurantListCopyWithImpl(
      _$_RestaurantList _value, $Res Function(_$_RestaurantList) _then)
      : super(_value, (v) => _then(v as _$_RestaurantList));

  @override
  _$_RestaurantList get _value => super._value as _$_RestaurantList;

  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? count = freezed,
    Object? restaurants = freezed,
  }) {
    return _then(_$_RestaurantList(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      restaurants: restaurants == freezed
          ? _value._restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RestaurantList implements _RestaurantList {
  _$_RestaurantList(
      {this.error,
      this.message,
      this.count,
      final List<Restaurant>? restaurants})
      : _restaurants = restaurants;

  factory _$_RestaurantList.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantListFromJson(json);

  @override
  final bool? error;
  @override
  final String? message;
  @override
  final int? count;
  final List<Restaurant>? _restaurants;
  @override
  List<Restaurant>? get restaurants {
    final value = _restaurants;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RestaurantList(error: $error, message: $message, count: $count, restaurants: $restaurants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantList &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality()
                .equals(other._restaurants, _restaurants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(_restaurants));

  @JsonKey(ignore: true)
  @override
  _$$_RestaurantListCopyWith<_$_RestaurantList> get copyWith =>
      __$$_RestaurantListCopyWithImpl<_$_RestaurantList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantListToJson(
      this,
    );
  }
}

abstract class _RestaurantList implements RestaurantList {
  factory _RestaurantList(
      {final bool? error,
      final String? message,
      final int? count,
      final List<Restaurant>? restaurants}) = _$_RestaurantList;

  factory _RestaurantList.fromJson(Map<String, dynamic> json) =
      _$_RestaurantList.fromJson;

  @override
  bool? get error;
  @override
  String? get message;
  @override
  int? get count;
  @override
  List<Restaurant>? get restaurants;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantListCopyWith<_$_RestaurantList> get copyWith =>
      throw _privateConstructorUsedError;
}

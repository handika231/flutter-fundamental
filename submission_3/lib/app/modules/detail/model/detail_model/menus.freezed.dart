// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Menus _$MenusFromJson(Map<String, dynamic> json) {
  return _Menus.fromJson(json);
}

/// @nodoc
mixin _$Menus {
  List<Food>? get foods => throw _privateConstructorUsedError;
  List<Drink>? get drinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenusCopyWith<Menus> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenusCopyWith<$Res> {
  factory $MenusCopyWith(Menus value, $Res Function(Menus) then) =
      _$MenusCopyWithImpl<$Res>;
  $Res call({List<Food>? foods, List<Drink>? drinks});
}

/// @nodoc
class _$MenusCopyWithImpl<$Res> implements $MenusCopyWith<$Res> {
  _$MenusCopyWithImpl(this._value, this._then);

  final Menus _value;
  // ignore: unused_field
  final $Res Function(Menus) _then;

  @override
  $Res call({
    Object? foods = freezed,
    Object? drinks = freezed,
  }) {
    return _then(_value.copyWith(
      foods: foods == freezed
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>?,
      drinks: drinks == freezed
          ? _value.drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as List<Drink>?,
    ));
  }
}

/// @nodoc
abstract class _$$_MenusCopyWith<$Res> implements $MenusCopyWith<$Res> {
  factory _$$_MenusCopyWith(_$_Menus value, $Res Function(_$_Menus) then) =
      __$$_MenusCopyWithImpl<$Res>;
  @override
  $Res call({List<Food>? foods, List<Drink>? drinks});
}

/// @nodoc
class __$$_MenusCopyWithImpl<$Res> extends _$MenusCopyWithImpl<$Res>
    implements _$$_MenusCopyWith<$Res> {
  __$$_MenusCopyWithImpl(_$_Menus _value, $Res Function(_$_Menus) _then)
      : super(_value, (v) => _then(v as _$_Menus));

  @override
  _$_Menus get _value => super._value as _$_Menus;

  @override
  $Res call({
    Object? foods = freezed,
    Object? drinks = freezed,
  }) {
    return _then(_$_Menus(
      foods: foods == freezed
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>?,
      drinks: drinks == freezed
          ? _value._drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as List<Drink>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Menus implements _Menus {
  _$_Menus({final List<Food>? foods, final List<Drink>? drinks})
      : _foods = foods,
        _drinks = drinks;

  factory _$_Menus.fromJson(Map<String, dynamic> json) =>
      _$$_MenusFromJson(json);

  final List<Food>? _foods;
  @override
  List<Food>? get foods {
    final value = _foods;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Drink>? _drinks;
  @override
  List<Drink>? get drinks {
    final value = _drinks;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Menus(foods: $foods, drinks: $drinks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Menus &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            const DeepCollectionEquality().equals(other._drinks, _drinks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_foods),
      const DeepCollectionEquality().hash(_drinks));

  @JsonKey(ignore: true)
  @override
  _$$_MenusCopyWith<_$_Menus> get copyWith =>
      __$$_MenusCopyWithImpl<_$_Menus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenusToJson(this);
  }
}

abstract class _Menus implements Menus {
  factory _Menus({final List<Food>? foods, final List<Drink>? drinks}) =
      _$_Menus;

  factory _Menus.fromJson(Map<String, dynamic> json) = _$_Menus.fromJson;

  @override
  List<Food>? get foods;
  @override
  List<Drink>? get drinks;
  @override
  @JsonKey(ignore: true)
  _$$_MenusCopyWith<_$_Menus> get copyWith =>
      throw _privateConstructorUsedError;
}

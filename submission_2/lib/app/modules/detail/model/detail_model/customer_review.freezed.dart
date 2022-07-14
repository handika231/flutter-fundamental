// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerReview _$CustomerReviewFromJson(Map<String, dynamic> json) {
  return _CustomerReview.fromJson(json);
}

/// @nodoc
mixin _$CustomerReview {
  String? get name => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerReviewCopyWith<CustomerReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerReviewCopyWith<$Res> {
  factory $CustomerReviewCopyWith(
          CustomerReview value, $Res Function(CustomerReview) then) =
      _$CustomerReviewCopyWithImpl<$Res>;
  $Res call({String? name, String? review, String? date});
}

/// @nodoc
class _$CustomerReviewCopyWithImpl<$Res>
    implements $CustomerReviewCopyWith<$Res> {
  _$CustomerReviewCopyWithImpl(this._value, this._then);

  final CustomerReview _value;
  // ignore: unused_field
  final $Res Function(CustomerReview) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? review = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      review: review == freezed
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CustomerReviewCopyWith<$Res>
    implements $CustomerReviewCopyWith<$Res> {
  factory _$$_CustomerReviewCopyWith(
          _$_CustomerReview value, $Res Function(_$_CustomerReview) then) =
      __$$_CustomerReviewCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? review, String? date});
}

/// @nodoc
class __$$_CustomerReviewCopyWithImpl<$Res>
    extends _$CustomerReviewCopyWithImpl<$Res>
    implements _$$_CustomerReviewCopyWith<$Res> {
  __$$_CustomerReviewCopyWithImpl(
      _$_CustomerReview _value, $Res Function(_$_CustomerReview) _then)
      : super(_value, (v) => _then(v as _$_CustomerReview));

  @override
  _$_CustomerReview get _value => super._value as _$_CustomerReview;

  @override
  $Res call({
    Object? name = freezed,
    Object? review = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_CustomerReview(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      review: review == freezed
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerReview implements _CustomerReview {
  _$_CustomerReview({this.name, this.review, this.date});

  factory _$_CustomerReview.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerReviewFromJson(json);

  @override
  final String? name;
  @override
  final String? review;
  @override
  final String? date;

  @override
  String toString() {
    return 'CustomerReview(name: $name, review: $review, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerReview &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.review, review) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(review),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_CustomerReviewCopyWith<_$_CustomerReview> get copyWith =>
      __$$_CustomerReviewCopyWithImpl<_$_CustomerReview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerReviewToJson(this);
  }
}

abstract class _CustomerReview implements CustomerReview {
  factory _CustomerReview(
      {final String? name,
      final String? review,
      final String? date}) = _$_CustomerReview;

  factory _CustomerReview.fromJson(Map<String, dynamic> json) =
      _$_CustomerReview.fromJson;

  @override
  String? get name;
  @override
  String? get review;
  @override
  String? get date;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerReviewCopyWith<_$_CustomerReview> get copyWith =>
      throw _privateConstructorUsedError;
}

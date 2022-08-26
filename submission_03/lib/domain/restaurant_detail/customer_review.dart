import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_review.freezed.dart';
part 'customer_review.g.dart';

@freezed
class CustomerReview with _$CustomerReview {
  factory CustomerReview({
    String? name,
    String? review,
    String? date,
  }) = _CustomerReview;

  factory CustomerReview.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewFromJson(json);
}

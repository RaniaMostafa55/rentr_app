class GetProductReviewsModel {
  int? statusCode;
  String? message;
  Dataa? data;
  GetProductReviewsModel({
    this.statusCode,
    this.message,
    this.data,
  });
  factory GetProductReviewsModel.fromJson(Map<String, dynamic> json) {
    return GetProductReviewsModel(
        statusCode: json['status_code'],
        message: json['message'],
        data: (json['data'] != null ? Dataa.fromJson(json['data']) : null));
  }
}

class Dataa {
  int? totalReviews;
  List<Review>? reviews;
  Dataa({this.totalReviews, this.reviews});
  factory Dataa.fromJson(Map<String, dynamic> json) {
    return Dataa(
        totalReviews: json['totalReview'],
        reviews: (json['reviews'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

class Review {
  int? id;
  int? rating;
  String? review;
  int? fromId;
  int? toId;
  Review({
    this.id,
    this.rating,
    this.review,
    this.fromId,
    this.toId,
  });
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        id: json['id'],
        rating: json['rating'],
        review: json['review'],
        fromId: json['from_id'],
        toId: json['to_id']);
  }
}

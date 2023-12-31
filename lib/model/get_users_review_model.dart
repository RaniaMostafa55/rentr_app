class GetUsersReviewModel {
  int? statusCode;
  String? message;
  UserReviewData? data;
  GetUsersReviewModel({
    this.statusCode,
    this.message,
    this.data,
  });
  factory GetUsersReviewModel.fromJson(Map<String, dynamic> json) {
    return GetUsersReviewModel(
        statusCode: json['status_code'],
        message: json['message'],
        data: (json['data'] != null
            ? UserReviewData.fromJson(json['data'])
            : null));
  }
}

class UserReviewData {
  int? totalReviews;
  int? numberOfRatings;
  UserReviewData({this.totalReviews, this.numberOfRatings});
  factory UserReviewData.fromJson(Map<String, dynamic> json) {
    return UserReviewData(
        totalReviews: json['totalReview'],
        numberOfRatings: json['numberOfRatings']);
  }
}

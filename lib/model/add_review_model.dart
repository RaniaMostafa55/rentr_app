class AddReviewModel {
  int? statusCode;
  String? message;
  ReviewData? data;
  AddReviewModel({
    this.statusCode,
    this.message,
    this.data,
  });
  factory AddReviewModel.fromJson(Map<String, dynamic> json) {
    return AddReviewModel(
        statusCode: json['status_code'],
        message: json['message'],
        data:
            (json['data'] != null ? ReviewData.fromJson(json['data']) : null));
  }
}

class ReviewData {
  int? id;
  num? rating;
  int? fromId;
  int? toId;
  ReviewData({
    this.id,
    this.rating,
    this.fromId,
    this.toId,
  });
  factory ReviewData.fromJson(Map<String, dynamic> json) {
    return ReviewData(
        id: json['id'],
        rating: json['rating'] as num,
        fromId: json['from_id'],
        toId: json['to_id']);
  }
}

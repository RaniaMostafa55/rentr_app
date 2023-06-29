class AddRequestModel {
  int? statusCode;
  String? message;
  AddRequestData? data;
  AddRequestModel({
    this.statusCode,
    this.message,
    this.data,
  });
  factory AddRequestModel.fromJson(Map<String, dynamic> json) {
    return AddRequestModel(
        statusCode: json['status_code'],
        message: json['message'],
        data: (json['data'] != null
            ? AddRequestData.fromJson(json['data'])
            : null));
  }
}

class AddRequestData {
  int? id;
  int? userId;
  String? productId;
  String? startBooking;
  String? endBooking;
  String? note;
  String? updatedAt;
  String? createdAt;
  AddRequestData(
      {this.id,
      this.userId,
      this.productId,
      this.startBooking,
      this.endBooking,
      this.note,
      this.updatedAt,
      this.createdAt});
  factory AddRequestData.fromJson(Map<String, dynamic> json) {
    return AddRequestData(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      startBooking: json['start_booking'],
      endBooking: json['end_booking'],
      note: json['note'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );
  }
}

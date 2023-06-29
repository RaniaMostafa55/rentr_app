class GlobalResponseModel {
  int? statusCode;
  String? message;

  GlobalResponseModel({
    this.statusCode,
    this.message,
  });
  factory GlobalResponseModel.fromJson(Map<String, dynamic> json) {
    return GlobalResponseModel(
      statusCode: json['status_code'],
      message: json['message'],
    );
  }
}

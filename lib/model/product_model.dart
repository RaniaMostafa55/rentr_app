import 'package:renta_app/controller/imports.dart';

class AddProductModel {
  int? statusCode;
  String? message;
  ItemData? data;
  AddProductModel({
    this.statusCode,
    this.message,
    this.data,
  });
  factory AddProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductModel(
        statusCode: json['status_code'],
        message: json['message'],
        data: (json['data'] != null ? ItemData.fromJson(json['data']) : null));
  }
}

import 'package:renta_app/controller/imports.dart';

class GetProductsByCategoryModel {
  int? statusCode;
  String? message;
  List<ItemData>? productsData;
  GetProductsByCategoryModel(
      {this.statusCode, this.message, this.productsData});
  factory GetProductsByCategoryModel.fromJson(Map<String, dynamic> json) {
    return GetProductsByCategoryModel(
        statusCode: json['status_code'],
        message: json['message'],
        productsData: (json['data'] as List<dynamic>?)
            ?.map((e) => ItemData.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

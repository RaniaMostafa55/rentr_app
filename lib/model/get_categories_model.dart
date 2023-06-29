import 'package:renta_app/controller/imports.dart';

class GetCategoriesModel {
  int? statusCode;
  String? message;
  List<Category>? productsData;
  GetCategoriesModel({this.statusCode, this.message, this.productsData});
  factory GetCategoriesModel.fromJson(Map<String, dynamic> json) {
    return GetCategoriesModel(
        statusCode: json['status_code'],
        message: json['message'],
        productsData: (json['data'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

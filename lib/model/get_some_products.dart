import 'package:renta_app/controller/imports.dart';

class GetSomeProductsModel {
  int? statusCode;
  String? message;
  List<ItemData>? productsData;
  GetSomeProductsModel({this.statusCode, this.message, this.productsData});
  factory GetSomeProductsModel.fromJson(Map<String, dynamic> json) {
    return GetSomeProductsModel(
        statusCode: json['status_code'],
        message: json['message'],
        productsData: (json['data'] as List<dynamic>?)
            ?.map((e) => ItemData.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

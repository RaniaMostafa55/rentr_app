import 'package:renta_app/controller/imports.dart';

class GetRequestsModel {
  int? statusCode;
  String? message;
  List<RequestsData>? requestsData;
  GetRequestsModel({this.statusCode, this.message, this.requestsData});
  factory GetRequestsModel.fromJson(Map<String, dynamic> json) {
    return GetRequestsModel(
      statusCode: json['status_code'],
      message: json['message'],
      requestsData: (json['data'] as List<dynamic>?)
          ?.map((e) => RequestsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class RequestsData {
  int? id;
  int? userId;
  int? productId;
  String? startDate;
  String? endDate;
  String? note;
  String? createdAt;
  String? updatedAt;
  ProductData? productData;
  UserData? renterData;
  RequestsData(
      {this.id,
      this.userId,
      this.productId,
      this.startDate,
      this.endDate,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.productData,
      this.renterData});
  factory RequestsData.fromJson(Map<String, dynamic> json) {
    return RequestsData(
        id: json['id'],
        userId: json['user_id'],
        productId: json['product_id'],
        startDate: json['start_booking'],
        endDate: json['end_booking'],
        note: json['note'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        productData: json['productRequests'] != null
            ? ProductData.fromJson(json['productRequests'])
            : null,
        renterData: json['userData'] != null
            ? UserData.fromJson(json['userData'])
            : null);
  }
}

class ProductData {
  int? id;
  String? name;
  String? description;
  int? price;
  double? latitude;
  double? longitude;
  String? startDate;
  String? endDate;
  String? image;
  String? images;
  int? userId;
  int? categoryId;
  ProductData({
    this.id,
    this.name,
    this.description,
    this.price,
    this.latitude,
    this.longitude,
    this.startDate,
    this.endDate,
    this.image,
    this.images,
    this.userId,
    this.categoryId,
  });
  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        startDate: json['startBooking'],
        endDate: json['endBooking'],
        image: json['image'],
        images: json['images'],
        userId: json['userId'],
        categoryId: json['category_id']);
  }
}

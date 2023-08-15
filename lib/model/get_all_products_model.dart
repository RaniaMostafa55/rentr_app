class GetAllProductsModel {
  int? statusCode;
  String? message;
  List<ProductsData>? productsData;
  GetAllProductsModel({this.statusCode, this.message, this.productsData});
  factory GetAllProductsModel.fromJson(Map<String, dynamic> json) {
    return GetAllProductsModel(
        statusCode: json['status_code'],
        message: json['message'],
        productsData: (json['data'] as List<dynamic>?)
            ?.map((e) => ProductsData.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

class ProductsData {
  ItemData? itemData;
  num? distance;
  ProductsData({this.itemData, this.distance});
  factory ProductsData.fromJson(Map<String, dynamic> json) {
    return ProductsData(
        itemData:
            (json['item'] != null ? ItemData.fromJson(json['item']) : null),
        distance: json['distance']);
  }
}

class ItemData {
  int? id;
  String? name;
  String? description;
  num? price;
  double? latitude;
  double? longitude;
  String? startDate;
  String? endDate;
  String? image;
  String? images;
  int? userId;
  int? categoryId;

  ItemData(
      {this.id,
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
      this.categoryId});
  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
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

class GetProductModel {
  int? statusCode;
  String? message;
  ProductDataa? data;
  GetProductModel({
    this.statusCode,
    this.message,
    this.data,
  });
  factory GetProductModel.fromJson(Map<String, dynamic> json) {
    return GetProductModel(
        statusCode: json['status_code'],
        message: json['message'],
        data: (json['data'] != null
            ? ProductDataa.fromJson(json['data'])
            : null));
  }
}

class ProductDataa {
  int? id;
  String? name;
  String? description;
  num? price;
  double? latitude;
  double? longitude;
  String? startDate;
  String? endDate;
  String? image;
  List<String>? images;
  Category? categoryData;

  ProductDataa(
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
      this.categoryData});
  factory ProductDataa.fromJson(Map<String, dynamic> json) {
    return ProductDataa(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        startDate: json['startBooking'],
        endDate: json['endBooking'],
        image: json['image'],
        images: json['images'].cast<String>(),
        categoryData: json['category'] != null
            ? Category.fromJson(json['category'])
            : null);
  }
}

class Category {
  int? id;
  String? nameArabic;
  String? nameEnglish;
  Category({this.id, this.nameArabic, this.nameEnglish});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      nameArabic: json['name_ar'],
      nameEnglish: json['name_en'],
    );
  }
}

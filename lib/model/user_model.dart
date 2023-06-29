class UserModel {
  int? statusCode;
  String? message;
  RegisterData? data;
  UserModel({
    this.statusCode,
    this.message,
    this.data,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        statusCode: json['status_code'],
        message: json['message'],
        data: (json['data'] != null
            ? RegisterData.fromJson(json['data'])
            : null));
  }
}

class RegisterData {
  int? id;
  String? name;
  String? email;
  String? phone;
  double? latitude;
  double? longitude;
  String? image;
  String? updatedAt;
  String? createdAt;
  RegisterData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.latitude,
    this.longitude,
    this.image,
    this.updatedAt,
    this.createdAt,
  });
  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      image: json['image'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );
  }
}

class LoginModel {
  int? statusCode;
  String? message;
  Data? data;
  LoginModel({this.statusCode, this.message, this.data});
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        statusCode: json['status_code'],
        message: json['message'],
        data: (json['data'] != null ? Data.fromJson(json['data']) : null));
  }
}

class Data {
  String? token;
  UserData? userData;
  Data({this.token, this.userData});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        token: json['access_token'],
        userData:
            (json['data'] != null ? UserData.fromJson(json['data']) : null));
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  double? latitude;
  double? longitude;
  String? image;
  String? createdAt;
  String? updatedAt;
  UserData(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.latitude,
      this.longitude,
      this.image,
      this.createdAt,
      this.updatedAt});
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        image: json['image'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}

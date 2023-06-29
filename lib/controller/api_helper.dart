class API {
//---------------------------------Auth--------------------------

  static const baseUrl = 'https://api.rentr.click/api';
  static const auth = '$baseUrl/auth/';
  static const register = '${auth}register';
  static const login = '${auth}login';
  static const sendOtp = '${auth}send-otp';
  static const verifyEmail = '${auth}verify-email';
  static const userData = '${auth}user';
  static const changePass = '${auth}change-password';
  static const resetPass = '${auth}reset-password';
  static const changeProfileImg = '${auth}profile-image';

//---------------------------------Requests------------------------

  static const requests = '$baseUrl/requests/';
  static const acceptRequest = '${requests}accept';
  static const refuseRequest = '${requests}refuse';

//---------------------------------Reviews-------------------------

  static const reviews = '$baseUrl/review/';
  static const productReview = '${reviews}product/';

//---------------------------------Products------------------------

  static const products = '$baseUrl/product/';
  static const searchProduct = '${products}search?name=';
  static const getProduct = '${products}get/';
  static const getCategories = '${products}categories';
  static const getProductsByCategory = '${products}category/';
}

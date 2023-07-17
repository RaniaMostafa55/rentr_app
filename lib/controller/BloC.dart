import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:renta_app/controller/imports.dart';

class BloC {
  final _userSubject = BehaviorSubject<UserModel>();
  Stream<UserModel> get user => _userSubject.stream;

  final _requestSubject = BehaviorSubject<GetRequestsModel>();
  Stream<GetRequestsModel> get request => _requestSubject.stream;

  final _userReviewSubject = BehaviorSubject<GetUsersReviewModel>();
  Stream<GetUsersReviewModel> get userReview => _userReviewSubject.stream;

  final _anotherUserReviewSubject = BehaviorSubject<GetUsersReviewModel>();
  Stream<GetUsersReviewModel> get anotherUserReview =>
      _anotherUserReviewSubject.stream;

  final _productReviewSubject = BehaviorSubject<GetProductReviewsModel>();
  Stream<GetProductReviewsModel> get productReview =>
      _productReviewSubject.stream;

  late UserModel userModel;
  late UserModel anotherUserModel;
  late UserModel userPicModel;
  late LoginModel loginModel;
  late GlobalResponseModel globalResponseModel;
  late AddRequestModel addRequestModel;
  late GetRequestsModel getRequestsModel;
  late GetUsersReviewModel getUserReviewModel;
  late GetUsersReviewModel getAnotherUserReviewModel;
  late GetProductReviewsModel getProductReviewModel;
  late AddReviewModel addReviewModel;
  late AddReviewModel addUserReviewModel;
  late AddProductModel? addProductModel;
  late GetAllProductsModel? getAllProductsModel;
  late GetSomeProductsModel? searchProductModel;
  late GetProductModel? getProductModel;
  late GetCategoriesModel? getCategoriesModel;
  late GetSomeProductsModel? getProductsByCategoryModel;
  File? imageFile;

  Future<void> signUp({
    context,
    required String name,
    required String email,
    required String password,
    required String phone,
    required String latitude,
    required String longitude,
  }) async {
    loadingDialog(context: context);
    Response signUpResponse = await post(Uri.parse(API.register), body: {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "latitude": latitude,
      "longitude": longitude
    });
    userModel = UserModel.fromJson(json.decode(signUpResponse.body));
    if (signUpResponse.statusCode == 201) {
      // getUserData();

      isSignUp = true;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OTPView(),
          ));
      showSnackBar(text: userModel.message!, context: context, isError: false);
    } else {
      Navigator.pop(context);
      showSnackBar(text: userModel.message!, context: context);
    }
  }

  Future<void> login({
    context,
    required String email,
    required String password,
  }) async {
    loadingDialog(context: context);
    Response loginResponse = await post(Uri.parse(API.login),
        body: {"email": email, "password": password});
    loginModel = LoginModel.fromJson(json.decode(loginResponse.body));
    if (loginResponse.statusCode == 200) {
      CacheHelper.putString(key: "token", value: loginModel.data!.token!);
      CacheHelper.putString(key: "emaill", value: email);
      CacheHelper.putString(
          key: "name", value: loginModel.data!.userData!.name!);
      CacheHelper.putBool(key: "isLoggedIn", value: true);
      CacheHelper.putInt(key: "id", value: loginModel.data!.userData!.id!);
      await getUserData();
      // getRequests(context: context);
      // getUserReview(context: context);
      await getCategories();
      await storeCategories();
      await getProductsByCategory(categoryId: "1");
      Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ));
    } else {
      Navigator.pop(context);
      showSnackBar(text: loginModel.message!, context: context);
    }
  }

  Future<void> sendOTP({context, required String email}) async {
    loadingDialog(context: context);
    recoveryMail = email;
    Response sendOTPResponse =
        await post(Uri.parse(API.sendOtp), body: {"email": email});
    globalResponseModel =
        GlobalResponseModel.fromJson(json.decode(sendOTPResponse.body));
    if (sendOTPResponse.statusCode == 200) {
      isSignUp = false;
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OTPView(),
          ));
      showSnackBar(
          text: globalResponseModel.message!, context: context, isError: false);
    } else {
      Navigator.pop(context);
      showSnackBar(text: globalResponseModel.message!, context: context);
    }
  }

  Future<void> submitOTP({context, required String otp}) async {
    loadingDialog(context: context);
    Response submitOTPResponse = await post(Uri.parse(API.verifyEmail), body: {
      "email": (isSignUp) ? CacheHelper.getString(key: "email") : recoveryMail,
      "otp": otp
    });
    globalResponseModel =
        GlobalResponseModel.fromJson(json.decode(submitOTPResponse.body));
    if (submitOTPResponse.statusCode == 200) {
      if (isSignUp == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ));
      } else {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChangePassView(),
            ));
      }
    } else {
      Navigator.pop(context);

      showSnackBar(text: globalResponseModel.message!, context: context);
    }
  }

  Future<void> resetPassword({context, required String pass}) async {
    loadingDialog(context: context);
    Response resetPassResponse = await post(Uri.parse(API.resetPass),
        body: {"email": recoveryMail, "password": pass});
    globalResponseModel =
        GlobalResponseModel.fromJson(json.decode(resetPassResponse.body));
    if (resetPassResponse.statusCode == 200) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ));
      showSnackBar(
          text: globalResponseModel.message!, context: context, isError: false);
    } else {
      Navigator.pop(context);
      showSnackBar(text: globalResponseModel.message!, context: context);
    }
  }

  Future<void> changePassword({context, required String pass}) async {
    loadingDialog(context: context);
    Response changePassResponse = await post(Uri.parse(API.changePass), body: {
      "password": pass,
    }, headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    globalResponseModel =
        GlobalResponseModel.fromJson(json.decode(changePassResponse.body));
    if (changePassResponse.statusCode == 200) {
      Navigator.pop(context);
      Navigator.pop(context);
      showSnackBar(
          text: globalResponseModel.message!, context: context, isError: false);
    } else {
      Navigator.pop(context);
      showSnackBar(text: globalResponseModel.message!, context: context);
    }
  }

  Future<void> changeUserData(
      {context,
      required String name,
      required String phone,
      required String latitude,
      required String longitude}) async {
    loadingDialog(context: context);
    Response changeUserDataResponse = await put(Uri.parse(API.userData), body: {
      "name": name,
      "phone": phone,
      "latitude": latitude,
      "longitude": longitude
    }, headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    globalResponseModel =
        GlobalResponseModel.fromJson(json.decode(changeUserDataResponse.body));
    if (changeUserDataResponse.statusCode == 200) {
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const ProfileView(),
      //     ));
      getUserData();
      Navigator.pop(context);
      Navigator.pop(context);
      showSnackBar(
          text: globalResponseModel.message!, context: context, isError: false);
    } else {
      Navigator.pop(context);
      showSnackBar(text: globalResponseModel.message!, context: context);
    }
  }

  Future<void> getUserData() async {
    Response userDataResponse = await get(
        Uri.parse('${API.userData}/${CacheHelper.getInt(key: "id")}'),
        headers: {
          "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
        });
    if (userDataResponse.statusCode == 200) {
      userModel = UserModel.fromJson(json.decode(userDataResponse.body));
      _userSubject.add(userModel);
    }
  }

  Future<void> getUserDataa({int? userId}) async {
    Response userDataaResponse =
        await get(Uri.parse('${API.userData}/$userId'), headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    if (userDataaResponse.statusCode == 200) {
      anotherUserModel =
          UserModel.fromJson(json.decode(userDataaResponse.body));
    }
  }

  void getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
    imageFile = File(pickedFile!.path);
    await addImage(filepath: imageFile!.path);
  }

  void getFromCamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    imageFile = File(pickedFile!.path);
    await addImage(filepath: pickedFile.path);
  }

  Future<void> addImage({required String filepath}) async {
    String addimageUrl = API.changeProfileImg;
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    };
    var request = http.MultipartRequest('PUT', Uri.parse(addimageUrl))
      ..headers.addAll(headers)
      ..files.add(http.MultipartFile.fromBytes(
          'image', imageFile!.readAsBytesSync(),
          filename: "profile pic"));
    var response = await request.send();
    if (response.statusCode == 200) {
      getUserData();
      print("Doneeeee");
    } else {
      print(response.statusCode);
    }
  }

  //------------------------------------Requests-----------------------------------------

  Future<void> addRequest(
      {context,
      required int productId,
      required String startDate,
      required String endDate,
      String? notes}) async {
    loadingDialog(context: context);
    Response addRequestResponse =
        await post(Uri.parse('${API.requests}$productId'), body: {
      'start_booking': startDate,
      'end_booking': endDate,
      'note': notes ?? ""
    }, headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    addRequestModel =
        AddRequestModel.fromJson(json.decode(addRequestResponse.body));
    if (addRequestResponse.statusCode == 200) {
      Navigator.pop(context);
      Navigator.pop(context);
      showSnackBar(
          text: addRequestModel.message!, context: context, isError: false);
    } else {
      Navigator.pop(context);
      showSnackBar(text: addRequestModel.message!, context: context);
    }
  }

  Future<void> getRequests({context}) async {
    loadingDialog(context: context);
    Response getRequestsResponse = await get(Uri.parse(API.requests), headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    getRequestsModel =
        GetRequestsModel.fromJson(json.decode(getRequestsResponse.body));
    if (getRequestsResponse.statusCode == 200) {
      Navigator.pop(context);
      Navigator.pop(context);
      _requestSubject.add(getRequestsModel);
      // Navigator.pop(context);
      // showSnackBar(
      //     text: globalResponseModel.message!, context: context, isError: false);
    } else {
      // Navigator.pop(context);
      showSnackBar(text: globalResponseModel.message!, context: context);
    }
  }

  Future<void> acceptRequest({context, required int id}) async {
    loadingDialog(context: context);
    Response acceptRequestResponse =
        await post(Uri.parse('${API.acceptRequest}/$id'), headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    globalResponseModel =
        GlobalResponseModel.fromJson(json.decode(acceptRequestResponse.body));
    if (acceptRequestResponse.statusCode == 200) {
      await getRequests(context: context);
      // Navigator.pop(context);
      showSnackBar(
          text: globalResponseModel.message!, context: context, isError: false);
    } else {
      Navigator.pop(context);
      showSnackBar(text: globalResponseModel.message!, context: context);
    }
  }

  Future<void> refuseRequest({context, required int id}) async {
    loadingDialog(context: context);
    Response refuseRequestResponse =
        await post(Uri.parse('${API.refuseRequest}/$id'), headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    globalResponseModel =
        GlobalResponseModel.fromJson(json.decode(refuseRequestResponse.body));
    if (refuseRequestResponse.statusCode == 200) {
      await getRequests(context: context);
      showSnackBar(
          text: globalResponseModel.message!, context: context, isError: false);
    } else {
      Navigator.pop(context);
      showSnackBar(text: globalResponseModel.message!, context: context);
    }
  }

  //------------------------------------Reviews-----------------------------------------

  Future<void> getUserReview({context}) async {
    Response getUserReviewResponse = await get(
        Uri.parse('${API.reviews}${CacheHelper.getInt(key: "id")}'),
        headers: {
          "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
        });
    getUserReviewModel =
        GetUsersReviewModel.fromJson(json.decode(getUserReviewResponse.body));
    if (getUserReviewResponse.statusCode == 200) {
      _userReviewSubject.add(getUserReviewModel);
    } else {
      showSnackBar(text: getUserReviewModel.message!, context: context);
    }
  }

  Future<void> getAnotherUserReview({context, required int userId}) async {
    Response getAnotherUserReviewResponse =
        await get(Uri.parse('${API.reviews}$userId'), headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    getAnotherUserReviewModel = GetUsersReviewModel.fromJson(
        json.decode(getAnotherUserReviewResponse.body));
    if (getAnotherUserReviewResponse.statusCode == 200) {
      _anotherUserReviewSubject.add(getAnotherUserReviewModel);
    } else {
      showSnackBar(text: getAnotherUserReviewModel.message!, context: context);
    }
  }

  Future<void> getProductReview({context, required int productId}) async {
    // loadingDialog(context: context);
    Response getProductReviewResponse =
        await get(Uri.parse('${API.productReview}$productId'), headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    getProductReviewModel = GetProductReviewsModel.fromJson(
        json.decode(getProductReviewResponse.body));
    if (getProductReviewResponse.statusCode == 200) {
      // Navigator.pop(context);
      _productReviewSubject.add(getProductReviewModel);
    } else {
      showSnackBar(text: getProductReviewModel.message!, context: context);
    }
  }

  Future<void> addProductReview({
    context,
    required String rate,
    required String review,
    required int productId,
  }) async {
    loadingDialog(context: context);
    Response addProductReviewResponse =
        await post(Uri.parse('${API.productReview}$productId'), body: {
      "rating": rate,
      "review": review
    }, headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    addReviewModel =
        AddReviewModel.fromJson(json.decode(addProductReviewResponse.body));
    if (addProductReviewResponse.statusCode == 200) {
      getProductReview(productId: productId);
      Navigator.pop(context);
      Navigator.pop(context);
      showSnackBar(
          text: addReviewModel.message!, context: context, isError: false);
    } else {
      Navigator.pop(context);
      showSnackBar(text: addReviewModel.message!, context: context);
    }
  }

  Future<void> addUserReview({
    context,
    required int toID,
    required String rating,
  }) async {
    loadingDialog(context: context);
    Response addProductReviewResponse =
        await post(Uri.parse('${API.reviews}$toID'), body: {
      "rating": rating,
    }, headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    addUserReviewModel =
        AddReviewModel.fromJson(json.decode(addProductReviewResponse.body));
    if (addProductReviewResponse.statusCode == 200) {
      getAnotherUserReview(context: context, userId: toID);
      Navigator.pop(context);
      Navigator.pop(context);
      showSnackBar(
          text: addUserReviewModel.message!, context: context, isError: false);
    } else {
      Navigator.pop(context);
      showSnackBar(text: addUserReviewModel.message!, context: context);
    }
  }

  //------------------------------Products--------------------------------------

  Future<void> addProduct(
      {context,
      required String name,
      required String description,
      required String price,
      required String latitude,
      required String longitude,
      required String startDate,
      required String endDate,
      required List<File> imageFileList,
      required String categoryId}) async {
    try {
      loadingDialog(context: context);
      List<dynamic>? documents = [];
      for (int i = 0; i < imageFileList.length; i++) {
        var path = imageFileList[i].path;
        documents.add(
          await dio.MultipartFile.fromFile(path,
              filename: path.split('/').last),
        );
      }
      dio.FormData formData = dio.FormData.fromMap({
        "name": name,
        "description": description,
        "price": price,
        "latitude": latitude,
        "longitude": longitude,
        "startBooking": startDate,
        "endBooking": endDate,
        "images": documents,
        "category_id": categoryId
      });
      Map<String, String> headers = {
        'content-type': 'application/json',
        'accept': 'application/json',
        "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
      };
      dio.Response response =
          await dio.Dio(dio.BaseOptions(baseUrl: API.baseUrl)).post('/product/',
              data: formData,
              options: dio.Options(headers: headers, method: 'POST'));
      if (response.statusCode == 200) {
        Navigator.pop(context);
        Navigator.pop(context);
        showSnackBar(
            text: response.data['message']!, context: context, isError: false);
      } else {
        Navigator.pop(context);
        showSnackBar(text: response.data['message']!, context: context);
      }
    } on dio.DioException catch (e) {
      Navigator.pop(context);
      print(e.response!.data);
    }
  }

  Future<void> searchProducts({context, required String searchText}) async {
    loadingDialog(context: context);
    Response searchProductsResponse =
        await get(Uri.parse('${API.searchProduct}$searchText'), headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    searchProductModel =
        GetSomeProductsModel.fromJson(json.decode(searchProductsResponse.body));
    if (searchProductsResponse.statusCode == 200) {
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      showSnackBar(text: searchProductModel!.message!, context: context);
    }
  }

  Future<void> getProduct({context, required String productId}) async {
    loadingDialog(context: context);
    Response getProductResponse =
        await get(Uri.parse('${API.getProduct}$productId'), headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    getProductModel =
        GetProductModel.fromJson(json.decode(getProductResponse.body));
    if (getProductResponse.statusCode == 200) {
      // Navigator.pop(context);
    } else {
      Navigator.pop(context);
      showSnackBar(text: getProductModel!.message!, context: context);
    }
  }

  Future<void> getCategories() async {
    Response getCategoriesResponse =
        await get(Uri.parse(API.getCategories), headers: {
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    });
    getCategoriesModel =
        GetCategoriesModel.fromJson(json.decode(getCategoriesResponse.body));
    if (getCategoriesResponse.statusCode == 200) {
      print("Done");
    } else {
      // Navigator.pop(context);
      // showSnackBar(text: getCategoriesModel!.message!, context: context);
    }
  }

  Future<void> getProductsByCategory({required String categoryId}) async {
    // loadingDialog(context: context);
    Response getProductByCategoryResponse = await get(
        Uri.parse('${API.getProductsByCategory}$categoryId'),
        headers: {
          "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
        });
    getProductsByCategoryModel = GetSomeProductsModel.fromJson(
        json.decode(getProductByCategoryResponse.body));
    if (getProductByCategoryResponse.statusCode == 200) {
      // Navigator.pop(context);
    } else {
      // Navigator.pop(context);
      // showSnackBar(
      //     text: getProductsByCategoryModel!.message!, context: context);
    }
  }

  Future<void> storeCategories() async {
    for (int i = 0; i < getCategoriesModel!.productsData!.length; i++) {
      arabicCategories.add(getCategoriesModel!.productsData![i].nameArabic!);
      englishCategories.add(getCategoriesModel!.productsData![i].nameEnglish!);
    }
    CacheHelper.putList(key: "arabic_categories", value: arabicCategories);
    CacheHelper.putList(key: "english_categories", value: englishCategories);
  }
}

import 'imports.dart' hide Response;

class MyProvider extends ChangeNotifier {
  bool isEnglish = CacheHelper.getBool(key: "isEnglish", choice: true);
  void changeLanguage({required bool isEng}) {
    if (isEng == true) {
      isEnglish = true;
    } else {
      isEnglish = false;
    }
    notifyListeners();
  }

  // File? imageFile;
  // TextEditingController imageController = TextEditingController();
  // ImageProvider<Object> image = const AssetImage("assets/images/man.jpg");

  // void getFromGallery() async {
  //   XFile? pickedFile = await ImagePicker().pickImage(
  //       source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
  //   imageFile = File(pickedFile!.path);
  //   image = FileImage(imageFile!);
  //   addImage(filepath: imageFile!.path);
  //   // imageController.text = pickedFile.name;

  //   notifyListeners();
  // }

  // Future<void> addImage({required String filepath}) async {
  //   try {
  //     // String addimageUrl = API.changeProfileImg;
  //     print(filepath);
  //     String fileName = filepath.split('/').last;
  //     print(fileName);
  //     FormData formData = FormData.fromMap({
  //       "image": await MultipartFile.fromFile(filepath, filename: fileName),
  //     });
  //     Map<String, String> headers = {
  //       'content-type': 'application/json',
  //       'accept': 'application/json',
  //       "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
  //     };
  //     Response response = await Dio(BaseOptions(baseUrl: API.baseUrl)).put(
  //         '/auth/profile-image/',
  //         data: formData,
  //         options: Options(headers: headers, method: 'PUT'));

  //     // var request = http.MultipartRequest('PUT', Uri.parse(addimageUrl))
  //     //   ..headers.addAll(headers)
  //     //   ..files.add(await http.MultipartFile.fromPath('image', filepath));
  //     // StreamedResponse response = await request.send();
  //     if (response.statusCode == 200) {
  //       print("Doneeeee");
  //       print(response.data);
  //       print(response.headers);
  //       print(response.statusMessage);
  //     } else {
  //       print(response.statusCode);
  //       print(response.data);
  //       print(response.headers);
  //       print(response.statusMessage);
  //       print("Nooooooooo");
  //     }
  //   } on DioException catch (e) {
  //     print(e.response!.data);
  //     print(e.response!.headers);
  //     print(e.response!.statusMessage);
  //   }
  // }
}

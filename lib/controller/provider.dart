import 'imports.dart';
import 'package:http/http.dart' as http;

class MyProvider extends ChangeNotifier {
  File? imageFile;
  // TextEditingController imageController = TextEditingController();
  ImageProvider<Object> image = const AssetImage("assets/images/man.jpg");

  bool isEnglish = CacheHelper.getBool(key: "isEnglish", choice: true);

  // void getFromGallery() async {
  //   XFile? pickedFile = await ImagePicker().pickImage(
  //       source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
  //   imageFile = File(pickedFile!.path);
  //   image = FileImage(imageFile!);
  //   addImage(filepath: imageFile!.path);
  //   // imageController.text = pickedFile.name;

  //   notifyListeners();
  // }

  void getFromCamera() async {
    XFile? pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxHeight: 1080, maxWidth: 1080);
    imageFile = File(pickedFile!.path);
    image = FileImage(imageFile!);
    // imageController.text = pickedFile.name;
    notifyListeners();
  }

  Future<void> addImage({required String filepath}) async {
    String addimageUrl = API.changeProfileImg;
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
    };
    var request = http.MultipartRequest('PUT', Uri.parse(addimageUrl))
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    var response = await request.send();
    if (response.statusCode == 200) {
      print("Doneeeee");
    } else {
      print("Nooooooooo");
    }
  }

  void changeLanguage({required bool isEng}) {
    if (isEng == true) {
      isEnglish = true;
    } else {
      isEnglish = false;
    }
    notifyListeners();
  }
}

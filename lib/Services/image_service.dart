import 'package:http/http.dart' as http;
import 'package:renta_app/controller/imports.dart';

class Service {
  Future<bool> addImage(Map<String, String> body, String filepath) async {
    String addimageUrl = API.changeProfileImg;
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('PUT', Uri.parse(addimageUrl))
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

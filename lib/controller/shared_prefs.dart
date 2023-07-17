import 'package:renta_app/controller/imports.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future putBool({required String key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool getBool({required String key, required bool choice}) {
    return (sharedPreferences!.getBool(key) == null)
        ? choice
        : sharedPreferences!.getBool(key)!;
  }

  static Future putList(
      {required String key, required List<String> value}) async {
    return await sharedPreferences!.setStringList(key, value);
  }

  static List<String> getList({required String key}) {
    return sharedPreferences!.getStringList(key)!;
  }

  static Future putInt({required String key, required int value}) async {
    return await sharedPreferences!.setInt(key, value);
  }

  static int getInt({required String key}) {
    return sharedPreferences!.getInt(key)!;
  }

  static Future putString({required String key, required String value}) async {
    return await sharedPreferences!.setString(key, value);
  }

  static String getString({required String key}) {
    return sharedPreferences!.getString(key)!;
  }
}

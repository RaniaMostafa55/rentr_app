import 'package:renta_app/controller/imports.dart';

class Utils {
  static Future _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  static Future whatsAppOpen({required String phoneNumber}) async {
    await FlutterLaunch.launchWhatsapp(phone: phoneNumber, message: "");
  }

  static Future openGoogleMaps(
      {required double latitude, required double longitude}) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    await _launchUrl(url);
  }
}

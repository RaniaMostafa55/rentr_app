import 'package:renta_app/controller/imports.dart';

class Utils {
  static Future _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  static Future openEmail({
    String? toEmail,
    String? subject,
    String? body,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject!)}&body=${Uri.encodeFull(body!)}';
    await _launchUrl(url);
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

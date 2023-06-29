import 'package:renta_app/controller/imports.dart';

Widget drawerTile(
    {required void Function() onTap,
    required String title,
    required IconData leading}) {
  return InkWell(
    onTap: onTap,
    child: ListTile(
      title: LocaleText(
        title,
        style: const TextStyle(fontSize: 15),
      ),
      leading: Icon(
        leading,
        color: secColor,
      ),
    ),
  );
}

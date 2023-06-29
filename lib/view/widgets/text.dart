import 'package:renta_app/controller/imports.dart';

Text titlee(
    {required String text,
    required double size,
    Color? color,
    FontWeight? weight}) {
  return LocaleText(
    text,
    style: TextStyle(
        fontSize: size,
        fontWeight: weight ?? FontWeight.w600,
        color: color ?? Colors.black),
  );
}

Text note({required String text, required double opacity, Color? color}) {
  return LocaleText(
    text,
    style:
        TextStyle(fontSize: 14, color: color ?? greyColor.withOpacity(opacity)),
  );
}

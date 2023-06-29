import 'package:renta_app/controller/imports.dart';

Padding data(
    {required String title,
    required String info,
    bool? isButton = false,
    void Function()? onPressed}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LocaleText(
          title,
          style: const TextStyle(
              color: greyColor, fontWeight: FontWeight.w400, fontSize: 14),
        ),
        (isButton!)
            ? InkWell(
                onTap: onPressed,
                child: LocaleText(info,
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: secColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14)),
              )
            : Text(info,
                style: const TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14))
      ],
    ),
  );
}

import 'package:renta_app/controller/imports.dart';

Container matButton(
    {context,
    required void Function()? onPressed,
    required String text,
    double? width = double.infinity,
    double? height,
    double? fontSize}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    height: height ?? MediaQuery.of(context).size.height * 0.065,
    child: MaterialButton(
      onPressed: onPressed,
      minWidth: width,
      color: (text != "Decline") ? mainColor : lightGreyColor,
      child: LocaleText(
        text,
        style: TextStyle(
            color: (text != "Decline") ? Colors.white : secColor,
            fontSize: (fontSize != null) ? fontSize : 18,
            fontWeight: FontWeight.w500),
      ),
    ),
  );
}

TextButton textButtonn(
    {required String text,
    required void Function()? onPressed,
    bool isNotUnderlined = false,
    required Color color}) {
  return TextButton(
    onPressed: onPressed,
    child: LocaleText(
      text,
      style: TextStyle(
          color: color,
          decoration: (!isNotUnderlined)
              ? TextDecoration.underline
              : TextDecoration.none),
    ),
  );
}

FloatingActionButton addButton({context}) {
  return FloatingActionButton(
      backgroundColor: mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddItem(),
            ));
      },
      child: const Icon(Icons.add));
}

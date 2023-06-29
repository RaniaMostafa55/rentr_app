import 'package:renta_app/controller/imports.dart';

TextFormField globalTextField(
    {required String label,
    String? hint,
    IconData? prefix,
    int? maxLines,
    IconData? suffix,
    void Function()? suffixTap,
    String? Function(String?)? validator,
    bool? obsecure,
    TextEditingController? controller,
    TextInputType? keyboardType,
    void Function(String)? onFieldSubmitted,
    required TextInputAction textInputAction,
    bool? readOnly,
    void Function()? onTap}) {
  return TextFormField(
    onFieldSubmitted: onFieldSubmitted,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    readOnly: readOnly ?? false,
    maxLines: maxLines ?? 1,
    decoration: InputDecoration(
        hintText: hint,
        label: LocaleText(
          label,
          style: TextStyle(color: greyColor.withOpacity(0.5)),
        ),
        prefixIcon: Icon(prefix, color: secColor),
        suffixIcon: IconButton(
            onPressed: suffixTap,
            icon: Icon(
              suffix,
              color: secColor,
              size: 20,
            )),
        fillColor: textFieldColor.withOpacity(0.20),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none)),
    validator: validator,
    obscureText: obsecure ?? false,
    controller: controller,
    onTap: onTap,
  );
}

import 'package:renta_app/controller/imports.dart';

Container shadowContainer(
    {context,
    double? height,
    double? width,
    required BorderRadiusGeometry borderRadius,
    Widget? child}) {
  return Container(
    width: width ?? double.infinity,
    height: height,
    //
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: textFieldColor.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ]),
    child: child,
  );
}

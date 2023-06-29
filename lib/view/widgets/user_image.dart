import 'package:renta_app/controller/imports.dart';

Container userImage(
    {context,
    required ImageProvider<Object> image,
    double? width,
    double? height}) {
  return Container(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Image(
        width: width ?? MediaQuery.of(context).size.width * 0.2,
        height: height ?? MediaQuery.of(context).size.height * 0.12,
        image: image,
        fit: BoxFit.cover),
  );

  // ClipRRect(
  //   borderRadius: BorderRadius.circular(10),
  //   child: Image(
  //     image: image,
  //     width: MediaQuery.of(context).size.width * 0.2,
  //     height: MediaQuery.of(context).size.height * 0.12,
  //     fit: BoxFit.cover,
  //   ),
  // );
}

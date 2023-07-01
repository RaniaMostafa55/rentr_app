import 'package:renta_app/controller/imports.dart';

Widget bottomSheet(
    {context,
    required void Function()? onGalleryPressed,
    void Function()? onCameraPressed,
    bool? isAddingItem = false}) {
  return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          titlee(text: "select_method", size: 17),
          const SizedBox(height: 20),
          (isAddingItem!)
              ? IconButton(
                  icon: const Icon(Icons.image, size: 35, color: secColor),
                  onPressed: onGalleryPressed)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 35,
                          color: secColor,
                        ),
                        onPressed: onCameraPressed),
                    IconButton(
                        icon:
                            const Icon(Icons.image, size: 35, color: secColor),
                        onPressed: onGalleryPressed)
                  ],
                )
        ],
      ));
}

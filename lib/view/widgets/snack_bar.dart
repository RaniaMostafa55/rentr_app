import 'package:renta_app/controller/imports.dart';

void showSnackBar({context, required String text, bool? isError = true}) {
  var snackBar = SnackBar(
    content: Text(text),
    backgroundColor: (isError!) ? secColor : Colors.green.shade300,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

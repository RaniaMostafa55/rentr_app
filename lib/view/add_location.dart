import 'package:renta_app/controller/imports.dart';

class AddLocation extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? latitudeController;
  final TextEditingController? longitudeController;

  const AddLocation(
      {super.key,
      required this.controller,
      this.latitudeController,
      this.longitudeController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: "add_location"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: OpenStreetMapSearchAndPick(
          buttonColor: mainColor,
          locationPinIconColor: secColor,
          center: (notSignedUpYet)
              ? LatLong(21.422510, 39.826168)
              : LatLong(bLoC.userModel.data!.latitude!,
                  bLoC.userModel.data!.longitude!),
          onPicked: (pickedData) {
            controller.text =
                "https://maps.google.com/?q=${pickedData.latLong.latitude},${pickedData.latLong.longitude}";
            latitudeController!.text = pickedData.latLong.latitude.toString();
            longitudeController!.text = pickedData.latLong.longitude.toString();
            // controller.text = (pickedData.latLong.latitude).toString();
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

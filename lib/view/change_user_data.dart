import 'package:renta_app/controller/imports.dart';

class ChangeUserData extends StatefulWidget {
  const ChangeUserData({super.key});

  @override
  State<ChangeUserData> createState() => _ChangeUserDataState();
}

class _ChangeUserDataState extends State<ChangeUserData> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController latitudeAddressController = TextEditingController();
  TextEditingController longitudeAddressController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    usernameController.text = bLoC.userModel.data!.name!;
    phoneController.text = bLoC.userModel.data!.phone!;
    addressController.text =
        "https://maps.google.com/?q=${bLoC.userModel.data!.latitude!},${bLoC.userModel.data!.longitude!}";
    latitudeAddressController.text = bLoC.userModel.data!.latitude!.toString();
    longitudeAddressController.text = bLoC.userModel.data!.longitude.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        isLogo: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Image(
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.18,
                    image: const AssetImage("assets/images/logo.png")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    titlee(text: "change_user_data", size: 22),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                globalTextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    label: "username",
                    suffix: Icons.edit,
                    controller: usernameController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                globalTextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    label: "phone_number",
                    suffix: Icons.edit,
                    controller: phoneController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                globalTextField(
                  textInputAction: TextInputAction.done,
                  label: "address",
                  readOnly: true,
                  suffix: Icons.edit,
                  controller: addressController,
                  onTap: () {
                    notSignedUpYet = false;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddLocation(
                            controller: addressController,
                            latitudeController: latitudeAddressController,
                            longitudeController: longitudeAddressController,
                          ),
                        ));
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                matButton(
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const HomeView(),
                      //     ));
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        bLoC.changeUserData(
                            name: usernameController.text,
                            phone: phoneController.text,
                            latitude: latitudeAddressController.text,
                            longitude: longitudeAddressController.text,
                            context: context);
                      }
                    },
                    text: "save",
                    context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

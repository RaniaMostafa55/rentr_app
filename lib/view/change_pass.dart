import 'package:renta_app/controller/imports.dart';

class ChangePassView extends StatefulWidget {
  const ChangePassView({super.key});

  @override
  State<ChangePassView> createState() => _ChangePassViewState();
}

class _ChangePassViewState extends State<ChangePassView> {
  bool passSecure = true;
  bool confirmPassSecure = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        // isDoubleBack: true,
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
                    titlee(text: "change_pass", size: 22),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                globalTextField(
                    controller: passController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    obsecure: passSecure,
                    suffixTap: () {
                      setState(() {
                        passSecure = !passSecure;
                      });
                    },
                    label: "Enter new password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      } else {
                        return null;
                      }
                    },
                    prefix: Icons.lock_outline,
                    suffix: Icons.remove_red_eye_outlined),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                globalTextField(
                    controller: confirmPassController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    obsecure: confirmPassSecure,
                    suffixTap: () {
                      setState(() {
                        confirmPassSecure = !confirmPassSecure;
                      });
                    },
                    label: "Re-enter new password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please re-enter your new password";
                      } else if (passController.text !=
                          confirmPassController.text) {
                        return "Not identical";
                      } else {
                        return null;
                      }
                    },
                    prefix: Icons.lock_outline,
                    suffix: Icons.remove_red_eye_outlined),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                matButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (isResetPass == true && isChangePass == false) {
                          bLoC.resetPassword(
                              context: context, pass: passController.text);
                        } else if (isResetPass == false &&
                            isChangePass == true) {
                          bLoC.changePassword(
                              context: context, pass: passController.text);
                        }
                      }
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const LoginView(),
                      //     ));
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

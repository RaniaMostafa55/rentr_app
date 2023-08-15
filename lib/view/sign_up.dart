import 'package:renta_app/controller/imports.dart';
import 'package:renta_app/view/terms_conditions.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool passSecure = true;
  bool confirmPassSecure = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userAddressController = TextEditingController();
  TextEditingController latitudeAddressController = TextEditingController();
  TextEditingController longitudeAddressController = TextEditingController();
  bool agreeToTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    titlee(text: "sign_up", size: 22),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    note(
                        text: "please_enter_the_required_data_to_sign_up",
                        opacity: 0.5),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                globalTextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    controller: usernameController,
                    label: "username",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your name";
                      } else {
                        return null;
                      }
                    },
                    prefix: Icons.person_outline),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                globalTextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailAddressController,
                    label: "email_address",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      } else {
                        return null;
                      }
                    },
                    prefix: Icons.email_outlined),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                globalTextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obsecure: passSecure,
                    suffixTap: () {
                      setState(() {
                        passSecure = !passSecure;
                      });
                    },
                    label: "password",
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
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    controller: confirmPassController,
                    obsecure: confirmPassSecure,
                    suffixTap: () {
                      setState(() {
                        confirmPassSecure = !confirmPassSecure;
                      });
                    },
                    label: "confirm_password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please re-type your password";
                      } else if (passwordController.text !=
                          confirmPassController.text) {
                        return "Not identical";
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
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  hint: "+966XXXXXXXXX",
                  controller: phoneController,
                  label: "phone_number",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your phone number";
                    } else {
                      return null;
                    }
                  },
                  prefix: Icons.phone_outlined,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                globalTextField(
                  textInputAction: TextInputAction.done,
                  controller: userAddressController,
                  label: "address",
                  readOnly: true,
                  prefix: Icons.location_on_outlined,
                  onTap: () {
                    notSignedUpYet = true;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddLocation(
                            controller: userAddressController,
                            latitudeController: latitudeAddressController,
                            longitudeController: longitudeAddressController,
                          ),
                        ));
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      checkColor: secColor,
                      activeColor: textFieldColor.withOpacity(0.8),
                      value: agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreeToTerms = !agreeToTerms;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const LocaleText(
                      "agree_to",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    textButtonn(
                        text: "terms_and_condidtions",
                        color: secColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TermsAndConditions(),
                            ),
                          );
                        })
                  ],
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.01,
                // ),
                // globalTextField(
                //     label: "Address",
                //     validator: (value) {
                //       if (value!.isEmpty) {
                //         return "Please enter your password";
                //       } else {
                //         return null;
                //       }
                //     },
                //     prefix: Icons.location_on_outlined,
                //     onTap: () {}),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                matButton(
                    onPressed: () {
                      if (agreeToTerms) {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          CacheHelper.putString(
                              key: "email", value: emailAddressController.text);
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => HomeView(),
                          //     ));
                          bLoC.signUp(
                              name: usernameController.text,
                              email: emailAddressController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                              latitude: latitudeAddressController.text,
                              longitude: longitudeAddressController.text,
                              context: context);
                        }
                      } else {
                        showSnackBar(
                            text: "You have to agree to terms & conditions",
                            context: context);
                      }
                    },
                    text: "Sign Up",
                    context: context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    note(text: "already_have_acc", opacity: 1),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ));
                        },
                        child:
                            note(text: "Login", opacity: 1, color: secColor)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

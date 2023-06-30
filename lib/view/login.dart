import 'package:renta_app/controller/imports.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool passSecure = true;
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.18,
                    image: const AssetImage("assets/images/logo.png"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      titlee(text: "login", size: 22),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      note(
                          text: "please_enter_your_email_and_password_to_login",
                          opacity: 0.5),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  globalTextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
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
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
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
                    height: MediaQuery.of(context).size.height * 0.001,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      textButtonn(
                          text: "forgot_password?",
                          color: greyColor.withOpacity(0.7),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPassView()));
                          }),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  matButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => HomeView(),
                          //     ));
                          bLoC.login(
                              email: emailAddressController.text,
                              password: passwordController.text,
                              context: context);
                        }
                      },
                      text: "login",
                      context: context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      note(text: "don't_have_an_account?", opacity: 1),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpView(),
                                ));
                          },
                          child: note(
                              text: "register_now",
                              opacity: 1,
                              color: secColor)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

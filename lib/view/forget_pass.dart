import 'package:renta_app/controller/imports.dart';

class ForgetPassView extends StatelessWidget {
  ForgetPassView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        isLogo: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 70),
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
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    titlee(text: "reset_password", size: 22),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    note(text: "please_enter_your_email_address", opacity: 0.5),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                globalTextField(
                    controller: emailController,
                    textInputAction: TextInputAction.none,
                    keyboardType: TextInputType.emailAddress,
                    label: "Email Address",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      } else {
                        return null;
                      }
                    },
                    prefix: Icons.email_outlined),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                matButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        bLoC.sendOTP(
                            email: emailController.text, context: context);
                      }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const OTPView(),
                      //     ));
                    },
                    text: "send_otp",
                    context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

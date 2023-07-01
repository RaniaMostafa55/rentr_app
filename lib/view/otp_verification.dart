import 'package:renta_app/controller/imports.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController pinputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        // isDoubleBack: true,
        isLogo: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
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
                  titlee(text: "otp_verify", size: 22),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  note(text: "enter_the_otp_sent_to_email", opacity: 0.5),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              GlobalPinPut(
                  controller: pinputController,
                  formKey: formKey,
                  validationText:
                      "Please enter the otp code sent to your email"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              matButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      bLoC.submitOTP(
                          context: context, otp: pinputController.text);
                      setState(() {
                        isResetPass = true;
                        isChangePass = false;
                        print(isResetPass);
                      });
                    }
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const ChangePassView(),
                    //     ));
                  },
                  text: "submit",
                  context: context),
            ],
          ),
        ),
      ),
    );
  }
}

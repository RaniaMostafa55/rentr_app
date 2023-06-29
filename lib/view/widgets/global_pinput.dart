import 'package:renta_app/controller/imports.dart';

class GlobalPinPut extends StatefulWidget {
  final String? validationText;
  final GlobalKey<FormState>? formKey;
  final TextEditingController? controller;
  final void Function(String?)? onCompleted;

  const GlobalPinPut({
    Key? key,
    this.validationText,
    this.formKey,
    this.controller,
    this.onCompleted,
  }) : super(key: key);

  @override
  State<GlobalPinPut> createState() => _GlobalPinPutState();
}

class _GlobalPinPutState extends State<GlobalPinPut> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = secColor;
    Color fillColor = textFieldColor.withOpacity(0.20);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(19),
      ),
    );
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 5,
              controller: widget.controller,
              focusNode: focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              validator: (value) {
                if (value!.isEmpty) {
                  return widget.validationText;
                } else {
                  return null;
                }
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: widget.onCompleted,
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

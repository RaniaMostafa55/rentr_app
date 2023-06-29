import 'package:renta_app/controller/imports.dart';

TextEditingController reviewController = TextEditingController();

rateDialog(
    {context,
    required List<bool> pressed,
    required String rated,
    int? productId,
    int? userId,
    bool? isItem = false,
    int sum = 0}) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Center(
                  child: titlee(
                      text: "Rate ${rated.capitalize}",
                      size: 20,
                      color: mainColor)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LocaleText(
                    "How was your experience with this $rated",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: greyColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => IconButton(
                          onPressed: () {
                            if (pressed[index] == false) {
                              for (int i = 0; i <= index; i++) {
                                setState(() {
                                  pressed[i] = true;
                                });
                              }
                            } else {
                              for (int j = pressed.length - 1;
                                  j >= index;
                                  j--) {
                                setState(() {
                                  pressed[j] = false;
                                });
                              }
                            }
                          },
                          icon: Icon(
                            (pressed[index])
                                ? Icons.star_rate
                                : Icons.star_rate_outlined,
                            color: yellowColor,
                            size: 30,
                          )),
                    ),
                  ),
                  (isItem!)
                      ? globalTextField(
                          label: "comment",
                          controller: reviewController,
                          maxLines: 5,
                          textInputAction: TextInputAction.done,
                          prefix: Icons.comment)
                      : const SizedBox(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  matButton(
                      onPressed: () {
                        for (int i = 0; i < pressed.length; i++) {
                          if (pressed[i] == true) {
                            sum++;
                            pressed[i] = false;
                          }
                        }
                        (isItem == true)
                            ? bLoC.addProductReview(
                                context: context,
                                rate: sum.toString(),
                                review: (reviewController.text.isEmpty)
                                    ? "No Comment"
                                    : reviewController.text,
                                productId: productId!)
                            : bLoC.addUserReview(
                                context: context,
                                toID: userId.toString(),
                                rating: sum.toString());
                        reviewController.text = '';
                      },
                      text: "Submit",
                      context: context),
                ],
              ));
        },
      );
    },
  );
}

loadingDialog({context}) {
  showDialog(
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: mainColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    LocaleText("please_wait")
                  ],
                )
              ],
            )),
      );
    },
  );
}

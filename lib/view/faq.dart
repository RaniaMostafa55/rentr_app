import 'package:renta_app/controller/imports.dart';

class FAQs extends StatelessWidget {
  const FAQs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "faqs",
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Image(
                  image: AssetImage("assets/images/faq.png"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              questionBox(question: "1st_q", answer: "1st_a"),
              questionBox(question: "2nd_q", answer: "2nd_a"),
              questionBox(question: "3rd_q", answer: "3rd_a")
            ],
          ),
        ),
      ),
    );
  }
}

Widget questionBox({required String question, required String answer}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: shadowContainer(
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titlee(
                  text: question,
                  size: 16,
                  weight: FontWeight.w600,
                  color: mainColor),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Container(
                  height: 1,
                  color: greyColor.withOpacity(0.12),
                ),
              ),
              LocaleText(
                answer,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  height: 1.6,
                  fontSize: 16,
                  color: greyColor,
                ),
              )
            ],
          ),
        )),
  );
}

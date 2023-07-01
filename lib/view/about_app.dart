import 'package:renta_app/controller/imports.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "About App",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
        child: Column(
          children: [
            Image(
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.18,
                image: const AssetImage("assets/images/logo.png")),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const LocaleText(
              textAlign: TextAlign.justify,
              "about_app_text",
              style: TextStyle(fontSize: 17, height: 1.7, color: greyColor),
            )
          ],
        ),
      ),
    );
  }
}

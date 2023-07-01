import 'package:renta_app/controller/imports.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/splash logo.png',
      splashIconSize: MediaQuery.of(context).size.width * 0.6,
      nextScreen: CacheHelper.getBool(key: "isFirstTime", choice: true)
          ? const OnBoarding()
          : (CacheHelper.getString(key: "token").isEmpty)
              ? const LoginView()
              : const HomeView(),
      // const OnBoarding(),
      splashTransition: SplashTransition.sizeTransition,
      curve: Curves.easeIn,

      // pageTransitionType: PageTransitionType.scale,
    );
  }
}

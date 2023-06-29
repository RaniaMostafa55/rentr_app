import 'package:renta_app/controller/imports.dart';
import 'package:renta_app/view/login_loading_page.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/logo.png',
      nextScreen: CacheHelper.getBool(key: "isFirstTime", choice: true)
          ? const OnBoarding()
          : (CacheHelper.getBool(key: "isLoggedIn", choice: false) == true)
              ? const LoginLoading()
              : const LoginView(),
      // const OnBoarding(),
      splashTransition: SplashTransition.sizeTransition,
      curve: Curves.easeIn,

      // pageTransitionType: PageTransitionType.scale,
    );
  }
}

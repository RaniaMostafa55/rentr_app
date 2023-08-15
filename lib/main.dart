import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'controller/imports.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  // showFlutterToast(
  //     message: "On background message", state: ToastStates.success);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then((value) {
    deviceToken = value;
    print("Tokennnnnnn issssssssssss $deviceToken");
  });
  FirebaseMessaging.onMessage.listen((event) {
    print(event.data.toString());
    // showFlutterToast(message: "On message", state: ToastStates.success);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data.toString());
    // showFlutterToast(
    //     message: "On message opened app", state: ToastStates.success);
  });
  FirebaseMessaging.onBackgroundMessage((firebaseMessagingBackgroundHandler));
  await CacheHelper.init();
  await Locales.init(['en', 'ar']);
  if (CacheHelper.getBool(key: "isLoggedIn", choice: false) == true) {
    await bLoC.getUserData();
    await bLoC.getCategories();
    await bLoC.getProductsByCategory(categoryId: "1");
  }
  HttpOverrides.global = MyHttpOverrides();
  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
  }

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
          localizationsDelegates: Locales.delegates,
          supportedLocales: Locales.supportedLocales,
          locale: locale,
          debugShowCheckedModeBanner: false,
          title: 'Rentr',
          theme: ThemeData(
              primaryColor: mainColor,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: secColor),
                // systemOverlayStyle: SystemUiOverlayStyle(
                //     statusBarColor: Colors.transparent,
                //     statusBarIconBrightness: Brightness.dark,
                //     systemNavigationBarColor: Colors.white,
                //     systemNavigationBarIconBrightness: Brightness.dark)
              ),
              fontFamily: "Poppin"),
          themeMode: ThemeMode.light,
          home: const SplashView()),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

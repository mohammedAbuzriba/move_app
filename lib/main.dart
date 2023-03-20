import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/on_boarding_page.dart';
import 'pages/sighup_page.dart';

Future<void> main() async {
  runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'appWithFirebase',
    options: FirebaseOptions(
        apiKey: 'AIzaSyAn380qtiqszftsIob9zQuJAczCnCYHdHw',
        appId: '1:1084716718588:android:6cbd91b9ec7f0f97d3fa79',
        messagingSenderId: '1084716718588',
        projectId: 'appwithfirepase'),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyscrollBehavior(),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        LoginPage.id: (context) => LoginPage(),
        SighUpPage.id: (context) => SighUpPage(),
        OnBoardingPage.id: (context) => OnBoardingPage(),
      },
      initialRoute: OnBoardingPage.id,
    );
  }
}

class MyscrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      };
}

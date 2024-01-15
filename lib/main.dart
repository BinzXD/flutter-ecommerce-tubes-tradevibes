import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tubes_mobile/pages/settingpage.dart';
import 'package:tubes_mobile/pages/splash_screen.dart';
import 'package:tubes_mobile/pages/homepage.dart';
import 'package:tubes_mobile/pages/user_auth/login_page.dart';
import 'package:tubes_mobile/pages/user_auth/sign_up.dart';
import 'package:tubes_mobile/pages/notifikasi.dart';
import 'package:tubes_mobile/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tubes Marketplace',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        // '/setting': (context) => SettingPage(),
        '/home': (context) => HomePage(),
        '/notifications': (context) => NotificationPage(),
      },
    );
  }
}

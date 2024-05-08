import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:thecoldbox/provider/theme_provider.dart';
import 'package:thecoldbox/screens/auth/auth_screen.dart';
import 'package:thecoldbox/screens/auth/forgetpassword_screen.dart';
import 'package:thecoldbox/screens/auth/login_screen.dart';
import 'package:thecoldbox/screens/home_screen.dart';
import 'package:thecoldbox/screens/main_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Lottie.asset('assets/splash-screen.json'),
        splashIconSize: 1000,
        centered: true,
        nextScreen: const MainScreen(),
        splashTransition: SplashTransition.slideTransition,
        duration: 2500,
        backgroundColor: const Color(0xff000000),
      ),
    );
  }
}


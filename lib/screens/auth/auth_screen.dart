import 'package:flutter/material.dart';
import 'package:thecoldbox/screens/auth/login_screen.dart';
import 'package:thecoldbox/screens/auth/register_screen.dart';
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  //initially show login page
  bool showLoginPage = true;

  //method to toggle screens
  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(showRegisterPage: toggleScreens,);
    }else{
      return RegisterScreen(showLoginPage: toggleScreens,);
    }
  }
}

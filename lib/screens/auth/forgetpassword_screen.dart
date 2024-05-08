import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  //controller
  final _emailController = TextEditingController();

  //method to reset password
  void resetPassword() {
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim())
        .then(
          (_) => showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text('Reset Password Link sent! Check your mail'),
                );
              }).catchError(
            (e) {
              if (e is FirebaseAuthException) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(e.message.toString()),
                    );
                  },
                );
              }
            },
          ),
        );
  }

  //dispose controller
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              scale: 2,
            ),
        
            const SizedBox(
              height: 10,
            ),
        
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Center(
                child: Text(
                  'Enter your email and we will send you a password reset link',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
        
            const SizedBox(
              height: 10,
            ),
        
            //email text-field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Enter Email ID',
                ),
              ),
            ),
        
            const SizedBox(
              height: 10,
            ),
        
            MaterialButton(
              color: Colors.deepPurple,
              onPressed: resetPassword,
              child: const Text(
                'Reset Password',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

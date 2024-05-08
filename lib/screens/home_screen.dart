import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:thecoldbox/components/custom_drawer.dart';
import 'package:thecoldbox/provider/user_name_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //get auth data of a logged in user
    User? user = FirebaseAuth.instance.currentUser;

    //future get details of fetch user's details
    final Future<DocumentSnapshot<Map<String, dynamic>>> userDetailsFuture =
    FirebaseFirestore.instance.collection('users').doc(user?.email).get();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello, '),
            UserNameWidget(future: userDetailsFuture, returnName: true),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: (){},
              child: Lottie.asset('assets/profile.json',
                      alignment: Alignment.center),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Image.asset('og_bg.png'),
          const Text("TESTING")
        ],
      ),
    );
  }
}

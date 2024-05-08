import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  _launchURL() async {
    final Uri url = Uri.parse('https://kiddo2507.github.io/TheColdBoxWebsite');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch the website');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Lottie.asset('assets/menu.json',
                    alignment: Alignment.center),

                //Header
                const Text('M E N U', style: TextStyle(fontSize: 40),),

                //The whole list
                const SizedBox(height: 25.0,),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    leading: Lottie.asset('assets/walking-broccoli.json',
                        alignment: Alignment.center),
                    title: const Text('T H E   C O L D   B O X'),
                    onTap: (){},
                  ),
                ),

                //Shopping list
                const SizedBox(height: 25.0,),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    leading: Lottie.asset('assets/cart.json',
                        alignment: Alignment.center),
                    title: const Text('S H O P P I N G    C A R T'),
                    onTap: (){},
                  ),
                ),

                //Settings
                const SizedBox(height: 25.0,),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    leading: Lottie.asset('assets/settings.json',
                        alignment: Alignment.center),
                    title: const Text('S E T T I N G S'),
                    onTap: (){},
                  ),
                ),

                //The Cold Box Website
                const SizedBox(height: 25.0,),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    leading: Lottie.asset('assets/walking-avocado.json',
                        alignment: Alignment.center),
                    title: const Text('W E B S I T E'),
                    onTap: _launchURL,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
              child: ListTile(
                leading: Lottie.asset('assets/tomato-hanging.json',
                    alignment: Alignment.center),
                title: const Text('L O G O U T'),
                onTap: () => FirebaseAuth.instance.signOut(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

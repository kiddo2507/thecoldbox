import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserNameWidget extends StatelessWidget {
  final Future<DocumentSnapshot<Map<String, dynamic>>> future;
  final bool returnName;

  const UserNameWidget({
    Key? key,
    required this.future,
    required this.returnName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // Extract data
          final Map<String, dynamic>? userDetails = snapshot.data!.data();
          final String? name = userDetails?['name'];
          final String? email = userDetails?['email'];

          // Return either name or email based on the parameter
          return Text(returnName ? name ?? 'Name not found' : email ?? 'Email not found');
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}

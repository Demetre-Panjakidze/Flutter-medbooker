import 'package:flutter/material.dart';
import 'package:medbooker_app/screens/homeScreen.dart';
import 'package:medbooker_app/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class MbLayoutScreen extends StatefulWidget {
  const MbLayoutScreen({super.key});

  @override
  State<MbLayoutScreen> createState() => _MbLayoutScreenState();
}

class _MbLayoutScreenState extends State<MbLayoutScreen> {
  void logOut() async {
    try {
      await _firebase.signOut();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MbHomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message ?? 'Authentification failed.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medbooker'),
        actions: [
          const Text('user'),
          const SizedBox(width: 5),
          OutlinedButton(
            onPressed: logOut,
            child: const Text(
              'Log Out',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      drawer: const MbDrawer(),
      body: const Text('bla'), // Dashboards and other pages will go here
    );
  }
}

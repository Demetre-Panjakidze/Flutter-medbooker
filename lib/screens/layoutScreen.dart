import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medbooker_app/pages/dashboard.dart';
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
  DocumentSnapshot? snapshot;
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(_firebase.currentUser!.uid)
        .get();
    setState(() {
      data = snapshot!.data() as Map<String, dynamic>;
    });
    print(data);
  }

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: const DashboardPage(),
        // child: Text(
        //   data == null
        //       ? "N/A"
        //       : data!['email'], // Dashboards and other pages will go here
        // ),
      ),
    );
  }
}

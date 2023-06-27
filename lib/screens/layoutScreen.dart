import 'package:flutter/material.dart';
import 'package:medbooker_app/screens/homeScreen.dart';
import 'package:medbooker_app/widgets/drawer.dart';

class MbLayoutScreen extends StatefulWidget {
  const MbLayoutScreen({super.key});

  @override
  State<MbLayoutScreen> createState() => _MbLayoutScreenState();
}

class _MbLayoutScreenState extends State<MbLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medbooker'),
        actions: [
          const Text('user'),
          const SizedBox(width: 5),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MbHomeScreen(),
                ),
              );
            },
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

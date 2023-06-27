import 'package:flutter/material.dart';

import '../pages/homepage.dart';

class MbHomeScreen extends StatefulWidget {
  const MbHomeScreen({super.key});

  @override
  State<MbHomeScreen> createState() => _MbHomeScreenState();
}

class _MbHomeScreenState extends State<MbHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medbooker'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: HomePage(),
      ),
    );
  }
}

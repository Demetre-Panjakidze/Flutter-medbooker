import 'package:flutter/material.dart';
import 'package:medbooker_app/widgets/drawer.dart';

class MbLayoutPage extends StatefulWidget {
  const MbLayoutPage({super.key, required this.title});

  final String title;

  @override
  State<MbLayoutPage> createState() => _MbLayoutPageState();
}

class _MbLayoutPageState extends State<MbLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          const Text('user'),
          const SizedBox(width: 5),
          OutlinedButton(
            onPressed: () {},
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      drawer: const MbDrawer(),
      body: const Text('bla'),
    );
  }
}

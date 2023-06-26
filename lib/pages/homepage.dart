import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {},
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 5),
        OutlinedButton(
          onPressed: () {},
          child: const Text(
            'Register',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MbHomepage extends StatefulWidget {
  const MbHomepage({super.key, required this.title});
  final String title;

  @override
  State<MbHomepage> createState() => _MbHomepageState();
}

class _MbHomepageState extends State<MbHomepage> {
  bool loginPressed = false;
  bool registerPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
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
        ),
      ),
    );
  }
}

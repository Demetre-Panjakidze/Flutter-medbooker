import 'package:flutter/material.dart';
import 'package:medbooker_app/screens/homeScreen.dart';
import 'package:medbooker_app/screens/logInScreen.dart';
import 'package:medbooker_app/screens/registerScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Medbooker',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MbLogInScreen(),
              ),
            );
          },
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 5),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MbRegisterScreen(),
              ),
            );
          },
          child: const Text(
            'Register',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

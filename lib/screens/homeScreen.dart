import 'package:flutter/material.dart';

import '../pages/homepage.dart';

class MbHomeScreen extends StatefulWidget {
  const MbHomeScreen({super.key, required this.pageTitle});
  final String pageTitle;

  @override
  State<MbHomeScreen> createState() => _MbHomeScreenState();
}

class _MbHomeScreenState extends State<MbHomeScreen> {
  bool loginPressed = false;
  bool registerPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Center(
        child: HomePage(
          title: widget.pageTitle,
        ),
      ),
    );
  }
}

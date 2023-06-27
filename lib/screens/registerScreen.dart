import 'package:flutter/material.dart';
import 'package:medbooker_app/screens/homeScreen.dart';
import 'package:medbooker_app/screens/layoutScreen.dart';
import 'package:medbooker_app/screens/logInScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class MbRegisterScreen extends StatefulWidget {
  const MbRegisterScreen({super.key});

  @override
  State<MbRegisterScreen> createState() => _MbRegisterScreenState();
}

class _MbRegisterScreenState extends State<MbRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _enteredEmail = '';
  String _enteredPassword = '';

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    if (!_isLogin) {
    } else {
      try {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MbLayoutScreen(),
          ),
        );
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.message ?? 'Authentification failed.'),
        ));
      }
    }
    print(_enteredEmail);
    print(_enteredPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const MbHomeScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.home),
                            ),
                            const Text('Register',
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email address',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (input) {
                            if (input == null ||
                                input.trim().isEmpty ||
                                !input.contains('@')) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredEmail = value!;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true,
                          validator: (input) {
                            if (input == null || input.trim().length < 6) {
                              return 'Enter at least 6 characters long password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const MbLogInScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(),
                              child: const Text('Log in'),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                              onPressed: _submit,
                              child: const Text('Register'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

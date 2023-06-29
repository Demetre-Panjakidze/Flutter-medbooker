import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:medbooker_app/screens/homeScreen.dart';
import 'package:medbooker_app/screens/layoutScreen.dart';
import 'package:medbooker_app/screens/logInScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medbooker_app/widgets/user_image_picker.dart';

List<String> roles = ['Doctor', 'Patient'];

final _firebase = FirebaseAuth.instance;

class MbRegisterScreen extends StatefulWidget {
  const MbRegisterScreen({super.key});

  @override
  State<MbRegisterScreen> createState() => _MbRegisterScreenState();
}

class _MbRegisterScreenState extends State<MbRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _enteredEmail = '';
  String _enteredPassword = '';
  String _enteredConfirmPassword = '';
  String _enteredFirstName = '';
  String _enteredLastName = '';
  File? _selectedImage;
  bool _isAuthenticating = false;
  String currentOption = roles[0];

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid && _selectedImage == null) {
      return;
    }

    _formKey.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });

      final userCredentials = await _firebase.createUserWithEmailAndPassword(
        email: _enteredEmail,
        password: _enteredPassword,
      );

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${userCredentials.user!.uid}.jpg');

      await storageRef.putFile(_selectedImage!);
      final imageUrl = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredentials.user!.uid)
          .set(
        {
          'first_name': _enteredFirstName,
          'last_name': _enteredLastName,
          'email': _enteredEmail,
          'image_url': imageUrl,
          'user_role': currentOption,
          'createdAt': Timestamp.now(),
        },
      );

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MbLayoutScreen(),
        ),
      );
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentification failed.'),
        ),
      );

      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                                      builder: (context) =>
                                          const MbHomeScreen(),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.home),
                              ),
                              const Text(
                                'Register',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UserImagePicker(
                                onPickImage: (pickedImage) {
                                  _selectedImage = pickedImage;
                                },
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: const Text('Doctor'),
                                      leading: Radio(
                                        value: roles[0],
                                        groupValue: currentOption,
                                        onChanged: (value) {
                                          setState(() {
                                            currentOption = value.toString();
                                          });
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text('Patient'),
                                      leading: Radio(
                                        value: roles[1],
                                        groupValue: currentOption,
                                        onChanged: (value) {
                                          setState(() {
                                            currentOption = value.toString();
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'First name',
                            ),
                            enableSuggestions: false,
                            autocorrect: false,
                            validator: (input) {
                              if (input == null ||
                                  input.isEmpty ||
                                  input.trim().length < 3) {
                                return 'Enter at least 3 characters long name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredFirstName = value!;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Last name',
                            ),
                            enableSuggestions: false,
                            autocorrect: false,
                            validator: (input) {
                              if (input == null ||
                                  input.isEmpty ||
                                  input.trim().length < 3) {
                                return 'Enter at least 3 characters long last name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredLastName = value!;
                            },
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
                              if (input == _enteredConfirmPassword) {
                                return 'Passwords should match';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredPassword = value!;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Confirm password',
                            ),
                            obscureText: true,
                            validator: (input) {
                              if (input == null || input.trim().length < 6) {
                                return 'Enter at least 6 characters long password';
                              }
                              if (input == _enteredPassword) {
                                return 'Passwords should match';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredConfirmPassword = value!;
                            },
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_isAuthenticating)
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: CircularProgressIndicator(),
                                ),
                              if (!_isAuthenticating)
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MbLogInScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(),
                                  child: const Text('Log in'),
                                ),
                              const SizedBox(
                                width: 30,
                              ),
                              if (!_isAuthenticating)
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
      ),
    );
  }
}

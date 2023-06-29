import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.user_role,
    required this.date,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.image_url,
  });

  final String user_role;
  final Timestamp date;
  final String image_url;
  final String last_name;
  final String first_name;
  final String email;
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class GoogleSign extends StatefulWidget {
  const GoogleSign({Key? key}) : super(key: key);

  @override
  State<GoogleSign> createState() => _GoogleSignState();
}

class _GoogleSignState extends State<GoogleSign> {
  final FirebaseAuth_auth = FirebaseAuth.instance;
  final GoogleSignIn_googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

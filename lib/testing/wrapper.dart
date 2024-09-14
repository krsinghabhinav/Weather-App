import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/testing/homesec.dart';
import 'package:firebasedemo/testing/loginsc.dart';
import 'package:flutter/material.dart';

class WrapperSec extends StatefulWidget {
  const WrapperSec({super.key});

  @override
  State<WrapperSec> createState() => _WrapperSecState();
}

class _WrapperSecState extends State<WrapperSec> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomeSec();
            } else {
              return const LogninSrc();
            }
          }),
    );
  }
}

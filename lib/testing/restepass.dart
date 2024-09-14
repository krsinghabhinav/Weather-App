import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasedemo/testing/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassScr extends StatefulWidget {
  const ResetPassScr({super.key});

  @override
  State<ResetPassScr> createState() => _ResetPassScrState();
}

class _ResetPassScrState extends State<ResetPassScr> {
  final TextEditingController resetpassword = TextEditingController();
  resetpass() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: resetpassword.text);
    Get.offAll(const WrapperSec());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          'Forgot Password',
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: resetpassword,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.email,
                        size: 35,
                      ),
                      hintText: "Emial",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (() => resetpass()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                minimumSize: const Size(200, 45),
                // Set the width and height here
              ),
              child: Text(
                "Forgot Password",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

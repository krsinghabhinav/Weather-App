import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/testing/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpSrc extends StatefulWidget {
  const SignUpSrc({super.key});

  @override
  State<SignUpSrc> createState() => _SignUpSrcState();
}

class _SignUpSrcState extends State<SignUpSrc> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

  signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: EmailController.text, password: PasswordController.text);
    Get.offAll(const WrapperSec());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SignUp Scr",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              TextFormField(
                controller: EmailController,
                decoration: const InputDecoration(
                    hintText: "email", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: PasswordController,
                decoration: const InputDecoration(
                    hintText: "password", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: (() => signup()),
                  child: const Text(
                    "SignUp",
                    style: TextStyle(fontFamily: "Billabong"),
                  )),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

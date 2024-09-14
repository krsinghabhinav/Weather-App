import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/testing/restepass.dart';
import 'package:firebasedemo/testing/signuoScr.dart';
import 'package:firebasedemo/testing/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogninSrc extends StatefulWidget {
  const LogninSrc({super.key});

  @override
  State<LogninSrc> createState() => _LogninSrcState();
}

class _LogninSrcState extends State<LogninSrc> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

  signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: EmailController.text, password: PasswordController.text);
    Get.to(const WrapperSec());
  }

  emailLogin() async {
    final GoogleSignInAccount? googlUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googlUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Scr"),
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
                  onPressed: (() => signin()), child: const Text("Login")),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Get.to(const ResetPassScr());
                },
                child: const Card(
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    const Text(
                      "Don't have an account",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(const SignUpSrc());
                      },
                      child: const Card(
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 180,
              ),
              GestureDetector(
                onTap: () {
                  emailLogin();
                  print("heelollllll");
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    "assest/image/im-removebg-preview.png",
                    fit: BoxFit
                        .cover, // Optional: Adjusts the image to fit the container
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

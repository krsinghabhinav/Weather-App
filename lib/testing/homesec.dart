import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeSec extends StatefulWidget {
  const HomeSec({super.key});

  @override
  State<HomeSec> createState() => _HomeSecState();
}

class _HomeSecState extends State<HomeSec> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home scr"),
        centerTitle: true,
      ),
      body: Center(child: Text('${user!.email}')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}

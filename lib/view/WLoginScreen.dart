import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewModel/login_viewModel.dart';

class WLoginScreen extends StatefulWidget {
  const WLoginScreen({super.key});

  @override
  State<WLoginScreen> createState() => _WLoginScreenState();
}

class _WLoginScreenState extends State<WLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const SizedBox(height: 35),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Consumer<LoginProvider>(
                          builder: (context, provider, child) {
                        return ElevatedButton(
                          onPressed: () {
                            print(
                                "login.................................................................................................");
                            if (!provider.islogin) {
                              provider.loginVM(emailController.text.trim(),
                                  passwordController.text.trim(), context);
                            }
                          },
                          child: provider.islogin
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.amber,
                                  ),
                                )
                              : Text("Login"),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

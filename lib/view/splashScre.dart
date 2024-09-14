import 'package:flutter/material.dart';
import 'package:firebasedemo/StorageHelper/storage_helper.dart';
import 'package:firebasedemo/view/WLoginScreen.dart';
import 'package:firebasedemo/view/locationScr.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterSplash();
  }

  Future<void> _navigateAfterSplash() async {
    await Future.delayed(Duration(seconds: 4));
    try {
      print(
          'Redection............................................. - ${StorageHelper().getToken()}');
      final token = await StorageHelper().getToken();
      print(
          'Redection************************************************ - ${StorageHelper().getToken()}');
      // Handle async if needed
      if (token != null && token.trim().isNotEmpty) {
        print(
            'Redectionghhhhhhhhhhhhhhhhhhhhhhhhhj - ${StorageHelper().getToken()}');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LocationScreen()),
        );
        print(
            'Redectionghhhhhhhhhhhhhhhhhhhhhhhhhj - ${StorageHelper().getToken()}');
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WLoginScreen()),
        );
        print(
            'Redectionghhhhhhhhhhhhhhhhhhhhhhhhhj - ${StorageHelper().getToken()}');
      }
    } catch (e) {
      print(
          'Redectionqqqqqqqqqqqqqqqqqqqqqqqqqqqqq - ${StorageHelper().getToken()}');

      // Handle any errors that occur during token retrieval
      print('Error retrieving token: $e');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WLoginScreen()),
      );
      print(
          'Redectionkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk - ${StorageHelper().getToken()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Splash Screen"),
      // ),
      body: Stack(
        children: [
          // Full-screen image background
          Positioned.fill(
            child: Image.asset(
              'assest/image/day-sun-weather-app-screen-mobile-inter.png', // Correct the path if needed
              fit: BoxFit.cover,
            ),
          ),
          // Centered content on top of the image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Center the column content vertically
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Center the column content horizontally
              children: [
                SizedBox(height: 280),
                // Add your widgets here, e.g., Text, Buttons, etc.
                titlewidget("Welcome"),
                titlewidget("to the"),
                titlewidget("Weather App"),

                // Add more widgets here
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text titlewidget(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 51, 50, 50),
      ),
    );
  }
}

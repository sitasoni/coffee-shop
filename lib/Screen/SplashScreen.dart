import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<StatefulWidget> createState() => SplashscreenState();
}

const coffeeDark = Color(0xFF1A120B);
const coffeeBrown = Color(0xFF3C2A21);
const coffeeAccent = Color(0xFFD5CEA3);

class SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/coffee3.png",
                width: 200,
                height: 200,
                // color: Colors.transparent,
              ),
              const Text(
                "Enjoy Coffee, Every Moment!",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}

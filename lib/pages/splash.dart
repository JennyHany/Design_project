import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 10);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/obs');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple[50]!, // Start color
              Colors.purple[900]! // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: content(),
      ),
    );
  }


  Widget content() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Keeps the content centered
        children: [
          Transform.scale(
            scale: 1, // Adjust the scale factor
            child: Lottie.asset('assets/splash_animation.json'),
          ),
          SizedBox(height: 20), // Adds spacing between animation and text
          Text(
            "HurryBite", // Your title
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oswald',
              color: Colors.white, // Adjust color if needed
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

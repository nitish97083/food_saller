import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_saller_app/global/global.dart';
import 'package:food_saller_app/screen/authentication/auth_screen.dart';
import 'package:food_saller_app/screen/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startTimer() {
    Timer(const Duration(seconds: 0), () async {
      //if seller is already logding already
      if (firebaseAuth.currentUser != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const HomePage(),
          ),
        );
      } else {
        //if seller is not logding already
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const AuthScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/images/splash.jpg"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Sell Food Online",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40, fontFamily: "Signatra", letterSpacing: 3),
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

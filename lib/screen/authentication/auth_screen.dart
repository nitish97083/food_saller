import 'package:flutter/material.dart';
import 'package:food_saller_app/screen/authentication/login.dart';
import 'package:food_saller_app/screen/authentication/register.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.cyan, Colors.amber],
                    begin: FractionalOffset(0, 0),
                    end: FractionalOffset(1.0, 0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp)),
          ),
          title: const Text(
            "iFood",
            style: TextStyle(
              fontFamily: "Lobster",
              fontSize: 50,
              //color: Colors.white,
            ),
          ),
          bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.lock,
                  ),
                  text: "Login",
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                  ),
                  text: "Register",
                ),
              ],
              // indicatorColor: Theme.of(context).colorScheme.background,
              indicatorWeight: 4),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.amber, Colors.cyan],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ),
          child: const TabBarView(
            children: [
              Login(),
              Register(),
            ],
          ),
        ),
      ),
    );
  }
}

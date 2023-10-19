import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? pref;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

ButtonStyle custElevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.purple,
  padding: const EdgeInsets.symmetric(
    horizontal: 90,
    vertical: 10,
  ),
);

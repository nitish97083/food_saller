import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_saller_app/screen/authentication/auth_screen.dart';
import 'package:food_saller_app/screen/home_page.dart';
import 'package:food_saller_app/widgets/error_dialog.dart';
import 'package:food_saller_app/widgets/loading_dialog.dart';

import '../../global/global.dart';
import '../../widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  _formValidation() {
    if (_email.text.trim().isNotEmpty && _password.text.trim().isNotEmpty) {
      _login();
    } else {
      showDialog(
        context: context,
        builder: (c) => const ErrorDialog(
            message: "Please write correct Email and password"),
      );
    }
  }

  void _login() async {
    showDialog(
        context: context,
        builder: (c) =>
            const LoadingDialog(message: "Checking Creadential Please wait.."));

    User? currentUser;
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(
              email: _email.text.trim(), password: _password.text.trim())
          .then((auth) => {currentUser = auth.user});
      await Firebase.initializeApp();
    } on FirebaseException catch (err) {
      print(err.code);
      print(err.message.toString());
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (ctx) => ErrorDialog(
          message: err.message.toString(),
        ),
      );
    }
    print('Current user ${currentUser..toString()}');
    if (currentUser != null) {
      await pref!.clear();
      _readDataAndSetDataLocaly(currentUser!);
    }
  }

  Future _readDataAndSetDataLocaly(User cUser) async {
    await FirebaseFirestore.instance
        .collection("sellers")
        .doc(cUser.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        await pref!.setString("uid", cUser.uid);
        await pref!.setString("email", snapshot.data()!['sellerEmail']);
        await pref!.setString("name", snapshot.data()!['sellerName']);
        await pref!.setString("sellerImage", snapshot.data()!['sellerImage']);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => const HomePage(),
          ),
        );
      } else {
        firebaseAuth.signOut();
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => const AuthScreen(),
          ),
        );
        showDialog(
          context: context,
          builder: (ctx) => const ErrorDialog(
            message: "No Record Found for the user",
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(15),
            height: 250,
            child: Image.asset("assets/images/seller.png"),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustTextField(
                  textEditingController: _email,
                  icon: Icons.email_outlined,
                  isObscure: false,
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                CustTextField(
                  textEditingController: _password,
                  icon: Icons.lock,
                  isObscure: true,
                  hintText: "Password",
                  textInputType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              _formValidation();
              print("login Button pressed");
            },
            style: custElevatedButtonStyle,
            child: const Text(
              "Login",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

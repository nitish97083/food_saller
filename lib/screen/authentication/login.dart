import 'package:flutter/material.dart';

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
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 10)),
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

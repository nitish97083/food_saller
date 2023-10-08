import 'package:flutter/material.dart';

class CustTextField extends StatelessWidget {
  CustTextField(
      {super.key,
      this.hintText,
      this.icon,
      this.isEnable,
      this.isObscure,
      this.textInputType,
      required this.textEditingController});

  final TextEditingController textEditingController;
  final String? hintText;
  final IconData? icon;
  bool? isObscure = true;
  bool? isEnable = true;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white70,
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        controller: textEditingController,
        obscureText: isObscure!,
        keyboardType: textInputType,
        enabled: isEnable,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: Colors.cyan,
            ),
            hintText: hintText),
      ),
    );
  }
}

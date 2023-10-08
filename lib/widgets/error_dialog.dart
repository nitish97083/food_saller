import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(message),
      backgroundColor: Colors.red[100],
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              // backgroundColor: Color.fromARGB(255, 152, 125, 125),
              ),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}

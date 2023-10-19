import 'package:flutter/material.dart';

class CustFlexible extends StatelessWidget {
  const CustFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.cyan, Colors.amber],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(1.0, 0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}

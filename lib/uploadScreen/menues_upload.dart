import 'package:flutter/material.dart';

import '../widgets/flexible.dart';

class MenuesUpload extends StatefulWidget {
  const MenuesUpload({super.key});

  @override
  State<MenuesUpload> createState() => _MenuesUploadState();
}

class _MenuesUploadState extends State<MenuesUpload> {
  defaultScreen() {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 139, 88),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Add New Menu'),
        centerTitle: true,
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        flexibleSpace: const CustFlexible(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.amber],
            begin: FractionalOffset(1, .2),
            end: FractionalOffset(.2, 1),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shop_2,
                color: const Color.fromARGB(255, 245, 240, 240),
                size: MediaQuery.of(context).size.height / 3,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.cyanAccent.withOpacity(0.8)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  child: const Text("Add New Menu"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return defaultScreen();
  }
}

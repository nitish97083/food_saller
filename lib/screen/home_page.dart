import 'package:flutter/material.dart';
import 'package:food_saller_app/screen/authentication/auth_screen.dart';
import 'package:food_saller_app/uploadScreen/menues_upload.dart';
import 'package:food_saller_app/widgets/my_drawer.dart';

import '../global/global.dart';
import '../widgets/flexible.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(pref!.getString('name'));
    print(pref!.getString('email'));
    print(pref!.getString('uid'));
    print(pref!.getString('sellerImage'));
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const MenuesUpload(),
                ),
              );
            },
            icon: const Icon(
              Icons.post_add,
              // color: Colors.cyan,
            ),
          ),
        ],
        title: Text(pref!.getString('name')!),
        centerTitle: true,
        flexibleSpace: const CustFlexible(),
      ),
    );
  }
}

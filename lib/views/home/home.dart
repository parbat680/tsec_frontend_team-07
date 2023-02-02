import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: ListView(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage('/assets/images/profile_default.png'),
                radius: 30,
              ),
              Text(
                "Roommate App",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      )),
    );
  }
}

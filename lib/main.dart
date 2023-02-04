import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tsec_app/controllers/auth_controller.dart';
import 'package:tsec_app/controllers/profile_controller.dart';
import 'package:tsec_app/views/auth/login_screen.dart';
import 'package:tsec_app/views/home/home.dart';

import 'package:tsec_app/views/home/profileSetup/userDetails.dart';
import 'firebase_options.dart';

void main() async {
  try {
    await GetStorage.init();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    log("Firebase not Initialized ...");
  }
  Get.put(AuthController());
  Get.put(ProfileController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Room Mate Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoaderOverlay(
        child: box.read('auth-token') == null ? LoginScreen() : HomeScreen(),
      ),
    );
  }
}

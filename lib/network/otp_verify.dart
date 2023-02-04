import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tsec_app/constant.dart';
import 'package:tsec_app/views/auth/otp_screen.dart';
import 'package:tsec_app/views/home/home.dart';
import 'package:tsec_app/views/home/profileSetup/userDetails.dart';
import 'package:tsec_app/views/widgets/botttom_sanckbar.dart';

class OtpVerification {
  static Future<void> authenticateUser(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phone',
      timeout: Duration(seconds: 60),
      verificationCompleted: ((phoneAuthCredential) =>
          log(phoneAuthCredential.toString())),
      verificationFailed: (error) =>
          showBottomSnack(title: 'Error', message: error.message.toString()),
      codeSent: (verificationId, resendToken) => Get.to(() => OtpScreen(
            verificationId: verificationId,
          )),
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  static Future<void> verifyOtp(verificationId, String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) =>
              UserAuthApi(FirebaseAuth.instance.currentUser!.phoneNumber));
    } catch (e) {
      showBottomSnack(title: "Error", message: "Otp verification failed");
    }
  }

  static Future<void> UserAuthApi(String? phone) async {
    try {
      String? number = await FirebaseAuth.instance.currentUser!.phoneNumber;
      GetStorage box = GetStorage();
      final response = await http.post(
        Uri.parse('$URL/user/signup'),
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode({
          'phone': phone,
        }),
      );

      log(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        box.write('auth-token', data['token']);
        Get.offAll(UserDetailsScreen());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

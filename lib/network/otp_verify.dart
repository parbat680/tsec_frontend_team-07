import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
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

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => Get.offAll(UserDetailsScreen()));
    } catch (e) {
      showBottomSnack(title: "Error", message: "Otp verification failed");
    }
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tsec_app/views/auth/otp_screen.dart';
import 'package:tsec_app/views/widgets/botttom_sanckbar.dart';

class OtpVerification {
  static Future<void> authenticateUser(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${phone}',
      verificationCompleted: ((phoneAuthCredential) =>
          log(phoneAuthCredential.toString())),
      verificationFailed: (error) =>
          showBottomSnack(title: 'Error', message: error.message.toString()),
      codeSent: (verificationId, resendToken) => Get.off(OtpScreen()),
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  static Future<void> verifyOtp(String verificationId, int resendCode) async {}
}

import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tsec_app/constant.dart';
import 'package:tsec_app/network/otp_verify.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Future<void> verifyPhone(phone) async {
    await OtpVerification.authenticateUser(phone);
  }

  Future<void> verifyOtp(verificationId, smsCode) async {
    await OtpVerification.verifyOtp(verificationId, smsCode);
  }
}

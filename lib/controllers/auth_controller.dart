import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
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

  Future<void> UserAuthApi(String phone) async {
    try {
      final response = await http.post(
        Uri.parse('$URL/user/signup'),
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode({
          'phone': '+91$phone',
        }),
      );

      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}

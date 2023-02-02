import 'package:get/get.dart';
import 'package:tsec_app/network/otp_verify.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Future<void> verifyPhone(phone) async {
    await OtpVerification.authenticateUser(phone);
  }

  Future<void> verifyOtp(verificationId, smsCode) async {
    await OtpVerification.verifyOtp(verificationId, smsCode);
  }
}

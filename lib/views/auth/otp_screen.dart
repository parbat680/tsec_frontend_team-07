import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinput/pinput.dart';
import 'package:tsec_app/controllers/auth_controller.dart';
import 'package:tsec_app/network/otp_verify.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
  OtpScreen({Key? key, required this.verificationId}) : super(key: key);

  RxBool isDisabled = true.obs;
  TextEditingController otp = TextEditingController();
  AuthController _authController = AuthController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Enter OTP \nhere",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                showPin(),
                SizedBox(
                  height: 40,
                ),
                Obx(() => ElevatedButton(
                      onPressed: isDisabled.value
                          ? null
                          : () async {
                              context.loaderOverlay.show();
                              await _authController.verifyOtp(
                                  verificationId, otp.text);
                              context.loaderOverlay.hide();
                              // OtpVerification.verifyOtp(
                              //     verificationId, otp.text);
                            },
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: const Text(
                        "Verify OTP",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 40,
                ),
                RichText(
                    text: TextSpan(
                        text: "Didn’t recieve ? ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () async {
                            context.loaderOverlay.show();
                            await OtpVerification.verifyOtp(
                                verificationId, otp.text);
                            context.loaderOverlay.hide();
                          },
                          child: Text(
                            "send again",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ]))
              ]),
        ),
      ),
    );
  }

  showPin() {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      length: 6,
      controller: otp,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      onChanged: (s) {
        (s.length == 6) ? isDisabled.value = false : isDisabled.value = true;
      },
      validator: (s) {
        if (s == null || s.length < 6 || !GetUtils.isNumericOnly(s)) {
          return "Enter valid otp";
        }
      },
      showCursor: true,
    );
  }
}

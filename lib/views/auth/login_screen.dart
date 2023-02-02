import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../network/otp_verify.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  RxBool isDisabled = true.obs;
  TextEditingController _phone = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Roommate\nApp",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("phone"),
                  hintText: "eg. 937226985",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.call),
                ),
                maxLength: 10,
                autofocus: true,
                onChanged: (value) {
                  value.length == 10
                      ? isDisabled.value = false
                      : isDisabled.value = true;
                },
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length != 10 ||
                      !GetUtils.isPhoneNumber(value)) {
                    return "Enter a valid phone number";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => ElevatedButton(
                    onPressed: isDisabled.value
                        ? null
                        : () {
                            OtpVerification.authenticateUser(_phone.text);
                          },
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Send OTP",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

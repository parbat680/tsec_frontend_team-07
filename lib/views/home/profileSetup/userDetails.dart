import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:tsec_app/views/home/home.dart';
import 'package:tsec_app/views/home/profileSetup/steps/user_info.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({Key? key}) : super(key: key);

  RxInt _currentStep = 0.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                child: Text(
                  "Complete your profile",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "skip",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        body: Stepper(
          controlsBuilder: (c, _) => Container(),
          physics: BouncingScrollPhysics(),
          type: StepperType.horizontal,
          currentStep: _currentStep.value,
          onStepTapped: (index) => _currentStep.value = index,
          elevation: 0,
          steps: [
            Step(
              title: Text(''),
              content: UserInfoScreen(),
              isActive: _currentStep.value >= 0,
              state: _currentStep.value > 0
                  ? StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: Text(''),
              content: HomeScreen(),
              isActive: _currentStep.value >= 1,
              state: _currentStep.value > 1
                  ? StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: Text(''),
              content: HomeScreen(),
              isActive: _currentStep.value >= 2,
              state: _currentStep.value > 2
                  ? StepState.complete
                  : StepState.disabled,
            ),
          ],
        ),
      ),
    );
  }
}

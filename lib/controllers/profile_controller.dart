import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tsec_app/constant.dart';
import 'package:http_parser/http_parser.dart';
import 'package:tsec_app/views/home/home.dart';
import 'package:tsec_app/views/widgets/botttom_sanckbar.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();

  RxMap<String, List<dynamic>> appartmentPrefs = {
    'BHK': [],
    'Bathroom': [],
    'Internet': [],
    'Near By': [],
  }.obs;

  RxMap<String, List<dynamic>> roomMatePrefs = {
    'Gender': [],
    'Rate': [],
    'Age': [],
    'Food Preference': [],
    'Your hobbies': [],
  }.obs;

  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController college = TextEditingController();
  TextEditingController stream = TextEditingController();

  RxString gender = 'male'.obs;
  RxString age = '18 - 24'.obs;

  File? uploadImage;

  Future<void> createProfile({required BuildContext context}) async {
    String? phone = FirebaseAuth.instance.currentUser!.phoneNumber;
    var body = jsonEncode({
      'phone': phone,
      'userage': 18,
      "gender": gender.value,
      'name': name.text,
      'stream': 'engineering',
      'college': 'St. Francis Institute of Technology',
      'work': '1 year',
      'experience': '3 months',
      'smoking': true,
      'oddHabits': "singing",
      'age': roomMatePrefs.value.entries.elementAt(2).value,
      'genderPref': roomMatePrefs.value.entries.elementAt(0).value,
      'food': roomMatePrefs.value.entries.elementAt(3).value,
      'rate': roomMatePrefs.value.entries.elementAt(1).value,
      'singing':
          roomMatePrefs.value.entries.elementAt(4).value.contains('singing'),
      'dancing':
          roomMatePrefs.value.entries.elementAt(4).value.contains('dancing'),
      'painting':
          roomMatePrefs.value.entries.elementAt(4).value.contains('painting'),
      'music': roomMatePrefs.value.entries.elementAt(4).value.contains('music'),
      'games': roomMatePrefs.value.entries.elementAt(4).value.contains('games'),
      'literature':
          roomMatePrefs.value.entries.elementAt(4).value.contains('literature'),
      'sports':
          roomMatePrefs.value.entries.elementAt(4).value.contains('sports'),
    });

    print(body);

    ///MultiPart request
    try {
      context.loaderOverlay.show();
      final response = await http.post(
        Uri.parse("$URL/profile/create"),
        headers: {"Content-type": "application/json"},
        body: body,
      );
      print(response.body);
      if (response.statusCode == 200) {
        Get.offAll(() => HomeScreen());
      } else {
        throw Exception();
      }
    } catch (e) {
      showBottomSnack(title: 'Error', message: "Something went wrong!!");
    } finally {
      context.loaderOverlay.hide();
    }
  }
}

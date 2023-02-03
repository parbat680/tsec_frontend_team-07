import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tsec_app/constant.dart';
import 'package:tsec_app/models/apartment.dart';
import 'package:tsec_app/models/roommate.dart';

class FetchRooms {
  static GetStorage box = GetStorage();

  static Future<List<RoomMate>> get() async {
    String? phone = FirebaseAuth.instance.currentUser!.phoneNumber;
    List<RoomMate> roommate = [];
    try {
      final response = await http.post(
        Uri.parse('$URL/profile/get'),
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode({
          'phone': phone,
        }),
      );

      print("here" + response.body.toString());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        roommate = data.map((e) => RoomMate.fromJson(e)).toList();
      } else
        throw Exception();
    } catch (e) {
      log(e.toString());
    }

    return roommate;
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tsec_app/constant.dart';
import 'package:tsec_app/models/apartment.dart';

class FetchSearch {
  static Future<List<Apartment>> get(String query) async {
    List<Apartment> aparments = [];
    try {
      final response = await http.post(
        Uri.parse('$URL/user/find/room'),
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode({
          'address': query,
          'name': query,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        aparments = data.map((e) => Apartment.fromJson(e)).toList();
      } else
        throw Exception();
    } catch (e) {
      log(e.toString());
    }

    return aparments;
  }
}

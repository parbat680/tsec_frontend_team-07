import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tsec_app/constant.dart';
import 'package:tsec_app/models/apartment.dart';

class FetchApartments {
  static Future<List<Apartment>> get() async {
    List<Apartment> aparments = [];
    try {
      final response = await http.get(Uri.parse('$URL/room/get'), headers: {
        'content-type': 'application/json',
      });

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

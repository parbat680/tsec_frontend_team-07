import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tsec_app/constant.dart';

class FetchApartments {
  static get() async {
    try {
      final response = await http.get(Uri.parse('$URL/'), headers: {
        'content-type': 'application/json',
      });
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}

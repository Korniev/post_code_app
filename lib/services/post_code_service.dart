import 'dart:convert';

import 'package:http/http.dart' as http;

class PostCodeService {
  Future<void> fetchPostCode(String query, Function(String) callback) async {
    var url = Uri.parse('https://api.zippopotam.us/es/ct/$query');
    var response = await http.get(url);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      callback(json.decode(response.body).toString());
    } else {
      callback('Error: ${response.statusCode}');
    }
  }
}

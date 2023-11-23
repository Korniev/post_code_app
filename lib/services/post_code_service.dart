import 'dart:convert';

import 'package:http/http.dart' as http;

class PostCodeService {
  Future<String> fetchCityInfo(String searchQuery) async {
    var url = Uri.parse('https://api.zippopotam.us/es/ct/$searchQuery');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final cityData = json.decode(response.body);

      var resultsOutput = (cityData['places'] as List).map((place) {
        return '${place['place name']}: ${place['post code']}';
      }).join('\n');

      return 'Results for "$searchQuery":\n$resultsOutput';
    } else {
      return "No data found or an error occurred";
    }
  }
}

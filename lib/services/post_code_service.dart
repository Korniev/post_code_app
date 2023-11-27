import 'dart:convert';

import 'package:http/http.dart' as http;

class PostCodeService {
  Future<String> fetchCityInfo(String searchQuery) async {
    Uri url;
    bool isZipCodeSearch;

    if (isNumeric(searchQuery)) {
      url = Uri.parse('https://api.zippopotam.us/es/$searchQuery');
      isZipCodeSearch = true;
    } else {
      url = Uri.parse('https://api.zippopotam.us/es/ct/$searchQuery');
      isZipCodeSearch = false;
    }

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final cityData = json.decode(response.body);

      var resultsOutput = (cityData['places'] as List).map((place) {
        var placeName = place['place name'];
        var postCode = isZipCodeSearch ? searchQuery : place['post code'];
        return '$placeName: $postCode';
      }).join('\n');

      return 'Results for "$searchQuery":\n$resultsOutput';
    } else {
      return "No data found or an error occurred";
    }
  }

  bool isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}

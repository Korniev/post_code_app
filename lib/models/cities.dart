// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  String countryAbbreviation;
  List<Place> places;
  String country;
  String placeName;
  String state;
  String stateAbbreviation;

  City({
    required this.countryAbbreviation,
    required this.places,
    required this.country,
    required this.placeName,
    required this.state,
    required this.stateAbbreviation,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        countryAbbreviation: json["country abbreviation"],
        places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
        country: json["country"],
        placeName: json["place name"],
        state: json["state"],
        stateAbbreviation: json["state abbreviation"],
      );

  Map<String, dynamic> toJson() => {
        "country abbreviation": countryAbbreviation,
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
        "country": country,
        "place name": placeName,
        "state": state,
        "state abbreviation": stateAbbreviation,
      };
}

class Place {
  String placeName;
  String longitude;
  String postCode;
  String latitude;

  Place({
    required this.placeName,
    required this.longitude,
    required this.postCode,
    required this.latitude,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeName: json["place name"],
        longitude: json["longitude"],
        postCode: json["post code"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "place name": placeName,
        "longitude": longitude,
        "post code": postCode,
        "latitude": latitude,
      };
}

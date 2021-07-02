import 'dart:convert';

List<Country> countriesFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

class Country {
  final String countryName;
  final String countryflag;
  final List<dynamic> countryCode;

  Country({
    required this.countryName,
    required this.countryflag,
    required this.countryCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryName: json['name'],
      countryflag: json['flag'],
      countryCode: json['callingCodes'],
    );
  }
}

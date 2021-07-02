import 'package:http/http.dart' as http;
import 'CountryModel.dart';

class Services {
  static const String url = 'https://restcountries.eu/rest/v2/all';

  static Future<List<Country>?> getCountries() async {
    final response =
        await http.get(Uri.parse(url), headers: {"accept": "application/json"});
    if (response.statusCode == 200) {
      print(response.body);
      final List<Country> countries = countriesFromJson(response.body);
      return countries;
    } else {
      throw Exception('Failed to load Countries List');
    }
  }
}

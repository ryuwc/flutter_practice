import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  final String url;
  final String url2;

  Network(this.url, this.url2);

  Future<dynamic> getJsonData() async {
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }

  Future<dynamic> getAirData() async {
    Uri uri = Uri.parse(url2);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}

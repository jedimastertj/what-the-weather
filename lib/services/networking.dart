import 'dart:convert';
import 'package:what_the_weather/utilities/constants.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    var uri = Uri.parse('$url&units=metric&appid=$kOwmApiKey');
    http.Response res = await http.get(uri);

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      print("${res.statusCode}: No weather data found");
    }
  }
}

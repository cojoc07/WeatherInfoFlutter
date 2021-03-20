import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class WeatherApiClient {
  final String baseUrl;
  final http.Client httpClient;

  WeatherApiClient({
    @required this.baseUrl,
    @required this.httpClient,
  }) : assert(httpClient != null);
}

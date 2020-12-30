import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:traffic_weather/components/tab_items.dart';

import 'package:http/http.dart' as http;
import 'package:traffic_weather/screens/forecast/seven_days.dart';

import 'forecast/today.dart';
import 'forecast/tomorrow.dart';

import '../components/search_widget.dart';

class MainScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  bool _isLoading = true;
  //weather data
  //today
  String _icon = "";
  int _temp = 0;
  int _apparentTemp = 0;
  int _day = 0;
  int _night = 0;
  String _summary = "";
  String _weekSummary = "";
  int _max = 0;
  int _min = 0;

  //tomorrow
  String _bicon;
  int _bmin = 0;
  int _bmax = 0;
  String _bsummary = "";
  int _batmpres = 0;
  int _bhumidity = 0;
  int _precipChance = 0;
  String _precipType = "";
  int _bmaxapparent = 0;
  int _bminapparent = 0;
  String _bsunrise = "";
  String _bsunset = "";

  TextEditingController controller = TextEditingController();
  bool isSearching = false;
  bool _folded = true;
  LatLng coords = LatLng(44.2, 27.32);
  @override
  void initState() {
    super.initState();
    fetchWeather(coords.latitude, coords.longitude);
  }

  Future<dynamic> fetchWeather(double lat, double long) async {
    var url = DotEnv().env['URL'];
    var token = DotEnv().env['TOKEN'];

    final response = await http
        .get('$url/forecast/$token/$lat,$long?exclude=hourly&lang=ro&units=si');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(
        () {
          //today
          _icon = data["currently"]["icon"];
          _temp = data["currently"]["temperature"].toInt();
          _summary = data["currently"]["summary"];
          _weekSummary = data["daily"]["summary"];
          _apparentTemp = data["currently"]["apparentTemperature"].toInt();
          _min = data["daily"]["data"][0]["temperatureLow"].toInt();
          _max = data["daily"]["data"][0]["temperatureHigh"].toInt();
          //tomorrow
          _bicon = data["daily"]["data"][1]["icon"];
          _bmin = data["daily"]["data"][1]["temperatureLow"].toInt();
          _bmax = data["daily"]["data"][1]["temperatureHigh"].toInt();
          _bsummary = data["daily"]["data"][1]["summary"];
          _batmpres = data["daily"]["data"][1]["pressure"].toInt();
          _bhumidity = data["daily"]["data"][1]["humidity"].toInt();
          _precipChance = data["daily"]["data"][1]["precipProbability"].toInt();
          _precipType = data["daily"]["data"][1]["precipType"];
          _bmaxapparent =
              data["daily"]["data"][1]["apparentTemperatureMax"].toInt();
          _bminapparent =
              data["daily"]["data"][1]["apparentTemperatureMin"].toInt();
          _bsunrise = data["daily"]["data"][1]["sunriseTime"].toString();
          _bsunset = data["daily"]["data"][1]["sunsetTime"].toString();
        },
      );
      _isLoading = false;
    } else {
      _isLoading = false;
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    var placesKey = DotEnv().env['PLACESKEY'];

    return WillPopScope(
      child: Scaffold(
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orange,
                  strokeWidth: 8,
                ),
              )
            : Stack(
                children: [
                  IndexedStack(
                    index: _currentIndex,
                    children: [
                      Today(
                        icon: _icon,
                        temp: _temp,
                        apparentTemp: _apparentTemp,
                        day: _day,
                        night: _night,
                        summary: _summary,
                        weekSummary: _weekSummary,
                        min: _min,
                        max: _max,
                      ),
                      Tomorrow(
                        icon: _bicon,
                        min: _bmin,
                        max: _bmax,
                        summary: _bsummary,
                        pressure: _batmpres,
                        humidity: _bhumidity,
                        precipChance: _precipChance,
                        precipType: _precipType,
                        minApparentTemp: _bminapparent,
                        maxApparentTemp: _bmaxapparent,
                        sunrise: _bsunrise,
                        sunset: _bsunset,
                      ),
                      SevenDays()
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SearchMapPlaceWidget(
                            location: LatLng(44.3, 26.09),
                            language: 'ro',
                            radius: 500000,
                            strictBounds: true,
                            apiKey: placesKey,
                            onSelected: (Place place) async {
                              final geolocation = await place.geolocation;
                              coords = LatLng(geolocation.coordinates.latitude,
                                  geolocation.coordinates.longitude);
                              fetchWeather(coords.latitude, coords.longitude);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) => setState(() => _currentIndex = index),
          items: [
            for (final tabItem in TabNavigationItem.items)
              BottomNavigationBarItem(
                icon: tabItem.icon,
                label: tabItem.title,
              )
          ],
        ),
      ),
      onWillPop: () async => false,
    );
  }
}

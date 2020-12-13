import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:traffic_weather/screens/login.dart';

class WeatherSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: LoginScreen(),
      title: Text(
        'Weather Info Flutter',
        textScaleFactor: 2,
      ),
      image: Image.asset('assets/images/cityscape.png'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}

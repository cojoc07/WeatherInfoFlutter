import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:traffic_weather/providers/auth.dart';
import 'package:traffic_weather/screens/splash.dart';

import 'screens/main_screen.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Auth(),
      child: Consumer<Auth>(
        builder: (context, cart, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Demo",
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MainScreen(),
          );
        },
      ),
    );
  }
}

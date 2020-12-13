import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String url = DotEnv().env['HOST'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather app")),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cityscape.png',
                  height: 200,
                )
              ],
            ),
          ),
          Container(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Introdu emailul',
              ),
              autofocus: false,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Parola',
                hintText: 'Introdu parola',
              ),
              autofocus: false,
            ),
          ),
          RaisedButton(
            onPressed: () => {SignIn("test@test.com", "12345678")},
            child: Text('Button', style: TextStyle(fontSize: 20)),
          )
        ],
      ),
    );
  }
}

Future<void> SignIn(String email, String password) async {
  var apiKey = DotEnv().env['FBKEY'];

  var url =
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" +
          apiKey;
  final response = await http.post(
    url,
    body: json.encode(
      {'email': email, 'password': password, 'returnSecureToken': true},
    ),
  );

  print(json.decode(response.body));
}

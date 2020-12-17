import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signUp(String email, String password) async {
    var apiKey = DotEnv().env['FBKEY'];
    var url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" +
        apiKey;

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true},
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw new Exception(responseData['error']['message']);
      }
      print(responseData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> signIn(String email, String password) async {
    var apiKey = DotEnv().env['FBKEY'];
    try {
      var url =
          "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" +
              apiKey;

      final response = await http.post(url,
          body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true},
          ));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        print(responseData['error']['message']);
        throw new Exception(responseData['error']['message']);
      }
      print(responseData);
    } catch (error) {
      throw error;
    }
  }
}

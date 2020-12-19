import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuth {
    print(token != null);

    return token != null;
  }

  String get token {
    /*  if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }

    return null; */
    return _token;
  }

  Future<String> test() async {
    _token = "TEST" + Random().nextInt(10).toString();
    print("Token este acum: " + _token);
    return "Success";
  }

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
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}

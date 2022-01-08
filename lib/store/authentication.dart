import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Authentication with ChangeNotifier {
  String? _token;

  bool get isAuthenticated {
    return _token != null;
  }

  Future<void> signup(String email, String password) async {
    try {
      final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCJB9rcFc0jJ1XVl36sAFe3g4CQnuXsURQ',
      );

      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      final responseData = json.decode(response.body);

      _token = responseData['idToken'];

      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCJB9rcFc0jJ1XVl36sAFe3g4CQnuXsURQ',
      );

      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      final responseData = json.decode(response.body);

      _token = responseData['idToken'];

      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  void logout() {
    _token = null;

    notifyListeners();
  }
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  MaterialColor _bcolor = Colors.indigo;
  MaterialColor get bcolor => _bcolor;

  setColor(MaterialColor value) {
    _bcolor = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          "email": email.trim(),
          "password": password.trim(),
        },
      );

      if (response.statusCode == 200) {
        print('Login Successful');
        print(response.body.toString());
        setLoading(false);
        setColor(Colors.green);
      } else {
        print('Login Failed');
        print(response.body.toString());
        setLoading(false);
        setColor(Colors.orange);
        throw Exception('Error occured');
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}

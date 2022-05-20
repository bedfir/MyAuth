import 'package:client/models/signup_form_model.dart';
import 'package:client/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/signin_form_model.dart';

class AuthProvider with ChangeNotifier {
  final String host = 'http://10.0.2.2';
  bool isLoading = false;
  late String? token;

  Future<dynamic> signup(SignupForm signupForm) async {
    try {
      isLoading = true;
      http.Response response = await http.post(
        Uri.parse('$host/api/user'),
        headers: {'Content-type': 'application/json'},
        body: json.encode(signupForm.toJson()),
      );
      isLoading = false;
      if (response.statusCode != 200) {
        return json.decode(response.body);
      }
      return null;
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

  Future<dynamic> sigin(SigninForm signinForm) async {
    try {
      isLoading = true;
      http.Response response = await http.post(
        Uri.parse('$host/api/auth'),
        headers: {'Content-type': 'application/json'},
        body: json.encode(signinForm.toJson()),
      );

      final Map<String, dynamic> body = json.decode(response.body);

      if (response.statusCode == 200) {
        final User user = User.fromJson(body['user']);
        token = body['token'];
        return user;
      } else {
        return body;
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}

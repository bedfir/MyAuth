import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  static const String routeName = '/signup';
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text(
          'SignupView ! ',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

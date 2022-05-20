import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  static const String routeName = '/signin';
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text(
          'SigninView ! ',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

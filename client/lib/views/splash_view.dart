import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text(
          'SplashView ! ',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

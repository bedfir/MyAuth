import 'package:flutter/material.dart';

import 'auth/signin_view.dart';
import 'auth/signup_view.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Bienvenu sur Dinya ! ',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade900,
              ),
              child: const Text(
                'S\'inscrire',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SigninView.routeName);
              },
              child: const Text(
                'Connexion',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

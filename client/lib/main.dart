import 'package:client/views/auth/signin_view.dart';
import 'package:client/views/auth/signup_view.dart';
import 'package:client/views/not_found_view.dart';
import 'package:client/views/profile_view.dart';
import 'package:flutter/material.dart';
import './views/home_view.dart';

void main() {
  runApp(const MyAuth());
}

class MyAuth extends StatefulWidget {
  const MyAuth({Key? key}) : super(key: key);

  @override
  State<MyAuth> createState() => _MyAuthState();
}

class _MyAuthState extends State<MyAuth> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my auth',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomeView(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case SigninView.routeName:
            MaterialPageRoute(builder: (_) => SigninView());
            break;
          case SignupView.routeName:
            MaterialPageRoute(builder: (_) => SignupView());
            break;
          case ProfileView.routeName:
            MaterialPageRoute(builder: (_) => ProfileView());
            break;
        }
      },
      onUnknownRoute: (settings) {
        MaterialPageRoute(builder: (_) => NotFoundView());
      },
    );
  }
}

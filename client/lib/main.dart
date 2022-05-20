import 'package:client/providers/auth_provider.dart';
import 'package:client/views/auth/signin_view.dart';
import 'package:client/views/auth/signup_view.dart';
import 'package:client/views/not_found_view.dart';
import 'package:client/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  final AuthProvider authProvider = AuthProvider();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: authProvider,
        ),
      ],
      child: MaterialApp(
        title: 'my auth',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: HomeView(),
        onGenerateRoute: (settings) {
          if (settings.name == HomeView.routeName) {
            return MaterialPageRoute(builder: (_) => const HomeView());
          } else if (settings.name == SigninView.routeName) {
            return MaterialPageRoute(builder: (_) => const SigninView());
          } else if (settings.name == SignupView.routeName) {
            return MaterialPageRoute(builder: (_) => const SignupView());
          } else if (settings.name == ProfileView.routeName) {
            return MaterialPageRoute(builder: (_) => const ProfileView());
          } else {
            return null;
          }
        },
        onUnknownRoute: (settings) {
          MaterialPageRoute(builder: (_) => NotFoundView());
        },
      ),
    );
  }
}

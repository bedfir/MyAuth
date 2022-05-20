import 'package:client/models/signup_form_model.dart';
import 'package:client/views/auth/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class SignupView extends StatefulWidget {
  static const String routeName = '/signup';
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late SignupForm signupForm;
  FormState get form => key.currentState!;

  @override
  void initState() {
    signupForm = SignupForm(email: null, username: null, password: null);
    super.initState();
  }

  Future<void> submitForm() async {
    if (form.validate()) {
      form.save();
      final error = await Provider.of<AuthProvider>(context, listen: false)
          .signup(signupForm);

      if (error == null) {
        Navigator.pushNamed(context, SigninView.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Inscription',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    'email',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade900,
                      filled: true,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    onSaved: ((newValue) => signupForm.email = newValue),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  const Text(
                    'username',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade900,
                      filled: true,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    onSaved: ((newValue) => signupForm.username = newValue),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  const Text(
                    'password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade900,
                      filled: true,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    onSaved: ((newValue) => signupForm.password = newValue),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  ElevatedButton(
                    onPressed: submitForm,
                    child: const Text(
                      'S\'inscrire',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

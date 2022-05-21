import 'package:client/models/user_model.dart';
import 'package:client/providers/auth_provider.dart';
import 'package:client/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:client/models/signin_form_model.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class SigninView extends StatefulWidget {
  static const String routeName = '/signin';
  const SigninView({Key? key}) : super(key: key);

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late SigninForm signinForm;
  FormState get form => key.currentState!;
  String? error;
  bool hidePassword = true;

  @override
  void initState() {
    signinForm = SigninForm(email: null, password: null);
    super.initState();
  }

  Future<void> submitForm() async {
    if (form.validate()) {
      form.save();
      final response = await Provider.of<AuthProvider>(context, listen: false)
          .sigin(signinForm);
      if (response is User) {
        Provider.of<UserProvider>(context, listen: false).updateUser(response);
        Navigator.pushNamed(context, ProfileView.routeName);
      } else {
        setState(() {
          error = response['error'];
        });
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
              'Connexion',
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
                    onSaved: ((newValue) => signinForm.email = newValue),
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
                    obscureText: hidePassword == true ? true : false,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: hidePassword == true
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.white,
                              ),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                      fillColor: Colors.grey.shade900,
                      filled: true,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    onSaved: ((newValue) => signinForm.password = newValue),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: error != null
                        ? Text(
                            error!,
                            style: const TextStyle(color: Colors.red),
                          )
                        : null,
                  ),
                  ElevatedButton(
                    onPressed: submitForm,
                    child: const Text(
                      'Se connecter',
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

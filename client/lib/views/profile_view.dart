import 'package:client/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../providers/user_provider.dart';
import 'home_view.dart';

class ProfileView extends StatelessWidget {
  static const String routeName = '/profile';
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          reverse: true,
          children: <Widget>[
            ListTile(
              tileColor: Theme.of(context).primaryColor,
              title: Text(
                'Deconnexion',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false).signout();
                Navigator.pushNamed(context, HomeView.routeName);
              },
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: user != null
            ? Text(
                user.username,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}

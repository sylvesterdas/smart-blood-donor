import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartblooddonor/auth/view/firebase_google_auth.dart';
import 'package:smartblooddonor/core/app_constants.dart';

class LoginView extends StatefulWidget {

  LoginView();

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey _containerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _containerKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Text(
              "Welcome,",
              style: TextStyle(
                fontSize: 20,
                color: primaryTextColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Sign in to access your data",
              style: TextStyle(
                  fontSize: 16,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w100),
            ),
          ),
//          FirebasePhoneAuth()
        FirebaseGoogleAuth()
        ],
      ),
    );
  }
}

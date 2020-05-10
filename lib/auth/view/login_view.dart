import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartblooddonor/core/app_constants.dart';
import 'package:smartblooddonor/utils/country/country_utils.dart';

class LoginView extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  LoginView({@required GlobalKey<ScaffoldState> scaffoldState})
      : _scaffoldKey = scaffoldState;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey _containerKey = GlobalKey();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _textEditingController = TextEditingController();

  String phoneNumber = "";
  String _smsVerificationCode;

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
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: CountryUtils.indianFlag(),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '+91',
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 8,
                        fontWeight: FontWeight.w300,
                        color: primaryTextColor),
                  ),
                ),
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.go,
                    expands: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: primaryTextColor,
                      letterSpacing: 8,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      BlacklistingTextInputFormatter(RegExp('[a-zA-Z]')),
                      LengthLimitingTextInputFormatter(10)
                    ],
                    onSubmitted: (_) => _signUp,
                    controller: _textEditingController,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: FlatButton(
              child: Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: _signUp,
              color: primaryColor,
            ),
          )
        ],
      ),
    );
  }

  _signUp() async {
    if (_textEditingController.value.text.isEmpty) return;
    phoneNumber = '+91${_textEditingController.value.text}';
    if (!RegExp('^(\\+91[\\-\\s]?)?[0]?(91)?[789]\\d{9}\$')
        .hasMatch(phoneNumber)) {
      widget._scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Invalid Input. Please verify'),
      ));
      return;
    }
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 5),
      verificationCompleted: (authCredential) =>
          _verificationComplete(authCredential, context),
      verificationFailed: (authException) =>
          _verificationFailed(authException, context),
      codeSent: (verificationId, [code]) =>
          _smsCodeSent(verificationId, [code]),
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
    );
  }

  _verificationComplete(AuthCredential authCredential, BuildContext context) {
    FirebaseAuth.instance
        .signInWithCredential(authCredential)
        .then((authResult) {
      final snackBar =
          SnackBar(content: Text("Success!!! UUID is: " + authResult.user.uid));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  _smsCodeSent(String verificationId, List<int> code) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
  }

  _verificationFailed(AuthException authException, BuildContext context) {
    final snackBar = SnackBar(
        content:
            Text("Exception!! message:" + authException.message.toString()));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _codeAutoRetrievalTimeout(String verificationId) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
  }
}

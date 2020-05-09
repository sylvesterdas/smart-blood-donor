import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:smartblooddonor/core/app_constants.dart';
import 'package:smartblooddonor/utils/alerts_messages.dart';

class LoginView extends StatelessWidget {
  final GlobalKey _containerKey = GlobalKey();
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey;

  LoginView({@required GlobalKey<ScaffoldState> scaffoldState}) : _scaffoldKey = scaffoldState;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _containerKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text("Register", style: TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
            child: InternationalPhoneNumberInput(
              autoFocus: true,
              autoValidate: true,
              countries: countries,
              ignoreBlank: true,
              countrySelectorScrollControlled: true,
              onInputChanged: (PhoneNumber number) => null,
              keyboardAction: TextInputAction.go,
              textFieldController: _textEditingController,
            ),
          ),
          Container(
            child: RaisedButton(child: Text("Submit"), onPressed: _signUp),
          )
        ],
      ),
    );
  }

  _signUp() {
    AlertsMessagesUtils.showInSnackBar(_scaffoldKey, "Submitted");
  }
}

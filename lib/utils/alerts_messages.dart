import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartblooddonor/core/app_constants.dart';

class AlertsMessagesUtils {
  static void showInSnackBar(GlobalKey<ScaffoldState> _scaffoldKey, String text,
      {Duration timeToDisplay = const Duration(seconds: 2)}) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  static showToast(msg, {long = true, timeForIos = 0}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: long ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: timeForIos != 0 ? timeForIos : (long ? 5 : 3),
        backgroundColor: primaryColor,
        textColor: secondaryTextColor,
        fontSize: 16.0);
  }
}

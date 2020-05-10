
import 'package:flutter/material.dart';
import 'package:smartblooddonor/core/app_constants.dart';

class AppGradient  {

  static LinearGradient get appGradient => LinearGradient(
      colors: [primaryTextColor, primaryColor],
      begin:  Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.01, 0.99]
    );


}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smartblooddonor/core/app_constants.dart';
import 'package:smartblooddonor/core/app_state.dart';

class HomeView extends StatelessWidget {


  Map _converter(Store<AppState> store) {
    return Map();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map>(
      converter: _converter,
      builder: (BuildContext context, Map stateObject) {
        return Scaffold(
          appBar: AppBar(
            title: Text(APP_NAME),
          ),
        );
      },
    );
  }

}
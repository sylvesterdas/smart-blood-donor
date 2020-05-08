import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smartblooddonor/components/app_scaffold.dart';
import 'package:smartblooddonor/components/app_slider.dart';
import 'package:smartblooddonor/core/app_constants.dart';
import 'package:smartblooddonor/core/app_state.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map _converter(Store<AppState> store) {
    return Map();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map>(
      converter: _converter,
      builder: (BuildContext context, Map stateObject) {
        return AppScaffold(
          primary: true,
          key: _scaffoldKey,
          body: AppSlider(
              panel: Column(
                children: <Widget>[
                  Text("This is the body")
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 50, 8, 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(24),
                          child: Text(
                            APP_NAME,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "You are a generous donor",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}

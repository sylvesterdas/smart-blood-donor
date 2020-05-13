import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:smartblooddonor/auth/view/login_view.dart';
import 'package:smartblooddonor/components/app_scaffold.dart';
import 'package:smartblooddonor/components/app_slider.dart';
import 'package:smartblooddonor/core/app_config.dart';
import 'package:smartblooddonor/core/app_constants.dart';
import 'package:smartblooddonor/core/app_state.dart';
import 'package:smartblooddonor/user/models/User.dart';

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
              panel: ValueListenableBuilder<User>(
                valueListenable: login,
                builder: (BuildContext context, value, Widget __) {
                  if (value == null || !value.isLoggedIn)
                    return Container(child: LoginView());
                  return Container(child: Text('Successfully Logged in'),);
                },
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            APP_NAME,
                            style: TextStyle(
                                color: primaryTextColor,
                                fontSize: 24.0,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "You are a generous donor",
                            style: TextStyle(
                              color: secondaryTextColor,
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

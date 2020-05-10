
import 'package:flutter/material.dart';
import 'package:smartblooddonor/core/app_constants.dart';

class AppScaffold extends StatelessWidget {

  final GlobalKey<ScaffoldState> _key;
  final String _title;
  final bool _primary, _showAppbar;
  final Widget _body;

  AppScaffold({
    @required GlobalKey<ScaffoldState> key,
    @required Widget body,
    bool showAppBar,
    String title,
    bool primary
  }) :
    _key = key, _body = body, _showAppbar = showAppBar ?? false, _title = title ?? APP_NAME, _primary = primary ?? false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Container(
        decoration: BoxDecoration(
            color: background
        ),
        child: _body,
      ),
      primary: _primary,
      appBar: _showAppbar ? AppBar(
        title: Text(_title, style: TextStyle(color: primaryTextColor),),
      ) : null,
    );
  }

}
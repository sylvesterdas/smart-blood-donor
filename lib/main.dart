import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:smartblooddonor/core/app_constants.dart';
import 'package:smartblooddonor/core/app_reducers.dart';
import 'package:smartblooddonor/core/app_routes.dart';
import 'package:smartblooddonor/core/app_state.dart';
import 'package:smartblooddonor/home/views/home_view.dart';
import 'package:smartblooddonor/utils/alerts_messages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Store<AppState> store = Store<AppState>(
    appReducers,
    initialState: AppState(),
    middleware: [thunkMiddleware]
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]).then((_) {
    runApp(StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: primaryColor,
          accentColor: accentColor,
        ),
        home: HomeView(),
        routes: routes,
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor)
          );
        },
      ),
    ));
  }).catchError((err) => AlertsMessagesUtils.showToast(err.toString()));
}

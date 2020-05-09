
import 'package:smartblooddonor/auth/auth_reducers.dart';
import 'package:smartblooddonor/core/app_state.dart';
import 'package:smartblooddonor/home/home_reducers.dart';

AppState appReducers(AppState state, action) {
  return AppState(
    homeState: homeReducer(state.homeState, action),
    authState: authReducer(state.authState, action),
  );
}
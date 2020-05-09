import 'package:redux/redux.dart';
import 'package:smartblooddonor/auth/auth_actions.dart';
import 'package:smartblooddonor/auth/auth_state.dart';

Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, LoginSuccessAction>(_loginSuccessActionCreator),
]);

AuthState _getCopy(AuthState state) {
  return AuthState().copyWith(
    isLoggedIn: state.isLoggedIn,
  );
}

AuthState _loginSuccessActionCreator(
    AuthState state, LoginSuccessAction action) {
  return _getCopy(state).copyWith(
    isLoggedIn: false,
  );
}

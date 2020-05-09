import 'package:flutter/material.dart';
import 'package:smartblooddonor/auth/auth_state.dart';
import 'package:smartblooddonor/home/home_state.dart';

@immutable
class AppState {
  final HomeState homeState;
  final AuthState authState;

  AppState({
    homeState,
    authState,
  })  : homeState = homeState ?? HomeState(),
        authState = authState ?? AuthState();

  AppState copyWith({
    HomeState homeState,
    AuthState authState,
  }) {
    return AppState(
        homeState: homeState ?? this.homeState,
        authState: authState ?? this.authState);
  }
}

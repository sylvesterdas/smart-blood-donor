import 'package:flutter/material.dart';

@immutable
class AuthState {
  final bool isLoggedIn;

  AuthState({
    this.isLoggedIn,
  });

  AuthState copyWith({
    bool isLoggedIn,
  }) {
    return AuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

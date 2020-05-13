import 'dart:convert';

import 'package:smartblooddonor/utils/utils.dart';

class User {
  bool isLoggedIn = false;

  String firstName;
  String lastName;
  String email;

  User({
    this.firstName,
    this.lastName,
    String email,
  }) {
    if (email.isNotEmpty) {
      this.email = email;
      isLoggedIn = true;
    }
  }

  static Map<String, String> toMap(User user) {
    return <String, String>{
      'email' : user.email,
      'firstName' : user.firstName,
      'lastName' : user.lastName,
      'isLoggedIn' : user.isLoggedIn.toString()
    };
  }

  @override
  String toString() => json.encode(toMap(this));

  static User fromMap(Map<String, String> userData) {
    if (userData == null) throw Exception("userData cannot be null");
    if (!userData.containsKey('email') || userData['email'].isEmpty)
      return User();
    return User(
      firstName: Utils.checkEmptyValue(userData, 'firstName')
          ? userData['firstName']
          : '',
      lastName: Utils.checkEmptyValue(userData, 'lastName')
          ? userData['lastName']
          : '',
      email: Utils.checkEmptyValue(userData, 'firstName')
          ? userData['firstName']
          : null,
    );
  }
}

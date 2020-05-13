

import 'package:flutter/material.dart';
import 'package:smartblooddonor/user/models/User.dart';

const APP_VERSION = "1.0.0";
const API_VERSION = "1";

//const String BASE_URL = "https://sylvesterdas.com";
const String BASE_URL = "https://sylvesterdas.com";

const API_URL = "$BASE_URL/api/$API_VERSION/";

bool dark = true;


ValueNotifier<User> login;
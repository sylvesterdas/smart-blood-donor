import 'package:flutter/material.dart';
import 'package:smartblooddonor/core/app_constants.dart';
import 'package:smartblooddonor/utils/country/country_list.dart';
import 'package:smartblooddonor/utils/country/country_model.dart';

class CountryUtils {
  static String propertyName = 'alpha_2_code';

  static get getIndianData {
    List jsonList = Countries.countryList;

    if (countries == null || countries.isEmpty) {
      return jsonList.map((country) => Country.fromJson(country)).toList();
    }
    List filteredList = jsonList.where((country) {
      return countries.contains(country[propertyName]);
    }).toList();

    return filteredList
        .map((country) => Country.fromJson(country))
        .toList()
        .first;
  }

  static indianFlag({double width = 32.0, double height = 32.0}) {
    return Image.asset(
      getIndianData?.flagUri,
      width: width,
      height: height,
    );
  }
}

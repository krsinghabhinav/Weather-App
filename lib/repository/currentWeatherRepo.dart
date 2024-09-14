import 'package:firebasedemo/BaseUrl/baseurl.dart';
import 'package:firebasedemo/model/currentWeatherModel.dart';
import 'package:firebasedemo/model/placeModel.dart';
import 'package:firebasedemo/network_Manage/http_helper.dart';
import 'package:flutter/material.dart';

class CurrentWeatherRepository {
  HttpHepler _weatherService = HttpHepler();

  Future<CurrentWeatherModel> getWeatherRepo(
      double latitude, double longitude) async {
    Map<String, dynamic> response = await _weatherService.getApi(
        url:
            "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true",
        isRequireAuthorization: true);
    return CurrentWeatherModel.fromJson(response);
  }
}

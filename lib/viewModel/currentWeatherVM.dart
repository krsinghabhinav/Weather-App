import 'package:firebasedemo/StorageHelper/storage_helper.dart';
import 'package:firebasedemo/model/LoginModel.dart';
import 'package:firebasedemo/model/currentWeatherModel.dart';

import 'package:firebasedemo/repository/currentWeatherRepo.dart';
import 'package:firebasedemo/response/apiResponse.dart';
import 'package:firebasedemo/utils/toastMessage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class WeatherProvider with ChangeNotifier {
  CurrentWeatherRepository currentWeatherRepository =
      CurrentWeatherRepository();
  bool isloading = false;
  String cityName = ' ';
  ApiResponse<CurrentWeatherModel> weatherModelList = ApiResponse.loading();
  setPlaceList(ApiResponse<CurrentWeatherModel> response) {
    weatherModelList = response;
    notifyListeners();
  }

  Future<CurrentWeatherModel?> getweatherVM(
      double latitude, double longitude) async {
    setPlaceList(ApiResponse.loading());
    isloading = true;
    notifyListeners();
    try {
      await currentWeatherRepository
          .getWeatherRepo(latitude, longitude)
          .then((value) async {
        List<Placemark> placemarks =
            await placemarkFromCoordinates(latitude, longitude);
        Placemark place = placemarks[0];

        cityName = place.locality ?? "";
        print(
            '${[place.country]}\n ${[place.locality]}\n ${[place.postalCode]}');
        print('Country: ${place.country}');
        print('Locality: ${place.locality}');
        print('Postal Code: ${place.postalCode}');
        setPlaceList(ApiResponse.completed(value));
        isloading = false;
        notifyListeners();
      });
    } catch (e) {
      setPlaceList(ApiResponse.error(e.toString()));
      toastMessage(e.toString());
      print(e.toString());

      isloading = false;
      notifyListeners();
      return null;
    }
  }
}

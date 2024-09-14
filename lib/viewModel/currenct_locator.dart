import 'package:firebasedemo/utils/toastMessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../StorageHelper/geolocator_hendler.dart';
import '../view/weatherScr.dart';

class CurrectLocationProvider with ChangeNotifier {
  bool isloading = false;

  getLanLong() {
    isloading = true;
    notifyListeners();
    determinePosition().then((value) {
      isloading = false;
      notifyListeners();
      Get.to(
          WeatherScreen(latitude: value.latitude, longitude: value.longitude));
    }).onError((error, StackTrace) {
      toastMessage(error.toString());
      isloading = false;
      notifyListeners();
    });
  }
}

  // loginVM(Object requestBody) {
  //   loginRepository
  //       .loginRepoPost(requestBody)
  //       .then((value) {})
  //       .onError((error, StackTrace) {});
  // }


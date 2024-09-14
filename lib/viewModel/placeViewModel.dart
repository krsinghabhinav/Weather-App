import 'package:firebasedemo/StorageHelper/storage_helper.dart';
import 'package:firebasedemo/model/LoginModel.dart';
import 'package:firebasedemo/model/placeModel.dart';
import 'package:firebasedemo/repository/PlacesRepo.dart';
import 'package:firebasedemo/response/apiResponse.dart';
import 'package:flutter/material.dart';

class PlaceProvider with ChangeNotifier {
  Placesrepository placesrepository = Placesrepository();

  ApiResponse<PlaceModel> placeModelList = ApiResponse.loading();
  setPlaceList(ApiResponse<PlaceModel> response) {
    placeModelList = response;
    notifyListeners();
  }

  Future<PlaceModel?> placeVM(String placeName) async {
    setPlaceList(ApiResponse.loading());
    try {
      await placesrepository.getplaceRepo(placeName).then((value) {
        setPlaceList(ApiResponse.completed(value));
        notifyListeners();
      });
    } catch (e) {
      setPlaceList(ApiResponse.error(e.toString()));
      print(e.toString());

      notifyListeners();
      return null;
    }
  }
}

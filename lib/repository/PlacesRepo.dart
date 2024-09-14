import 'package:firebasedemo/BaseUrl/baseurl.dart';
import 'package:firebasedemo/model/placeModel.dart';
import 'package:firebasedemo/network_Manage/http_helper.dart';
import 'package:flutter/material.dart';

class Placesrepository {
  HttpHepler _placeService = HttpHepler();

  Future<PlaceModel> getplaceRepo(String placeName) async {
    Map<String, dynamic> response = await _placeService.getApi(
        url:
            "https://geocoding-api.open-meteo.com/v1/search?name=$placeName&count=10&language=en&format=json",
        isRequireAuthorization: true);
    return PlaceModel.fromJson(response);
  }
}


//  Future<List<UserListModelArray>> fetchGetApiarry() async {
//     List<dynamic> response = await _apiHelper.getApi(
//         url: 'https://jsonplaceholder.typicode.com/users');
//     return List<UserListModelArray>.from(
//         response.map((element) => UserListModelArray.fromJson(element)));
//   }
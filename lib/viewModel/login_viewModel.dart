import 'package:firebasedemo/StorageHelper/storage_helper.dart';
import 'package:firebasedemo/model/LoginModel.dart';
import 'package:firebasedemo/response/apiResponse.dart';
import 'package:flutter/material.dart';

import '../repository/LoginRepo.dart';
import '../view/locationScr.dart';

class LoginProvider with ChangeNotifier {
  LoginRepository loginRepository = LoginRepository();

  bool islogin = false;
  // bool get islogin => _islogin;
  ApiResponse<LoginModel> loginModelList = ApiResponse.loading();
  setLoginList(ApiResponse<LoginModel> response) {
    loginModelList = response;
  }

  notifyListeners();
  Future<LoginModel?> loginVM(
      String email, String password, BuildContext context) async {
    setLoginList(ApiResponse.loading());
    islogin = true;
    notifyListeners();
    Map requestBody = {
      "email": email,
      "password": password,
    };
// "email": "eve.holt@reqres.in",
//     "password": "cityslicka"
    try {
      final logvalue = await loginRepository.loginRepoPost(requestBody);
      setLoginList(ApiResponse.completed(logvalue));
      islogin = false;
      print('token ------------${logvalue.token}');
      StorageHelper().setToken(logvalue.token ?? "");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LocationScreen()),
      );
    } catch (e) {
      setLoginList(ApiResponse.error(e.toString()));
      print(e.toString());
      islogin = false;
      notifyListeners();
      return null;
    }
  }

  // loginVM(Object requestBody) {
  //   loginRepository
  //       .loginRepoPost(requestBody)
  //       .then((value) {})
  //       .onError((error, StackTrace) {});
  // }
}

import 'package:firebasedemo/model/LoginModel.dart';
import 'package:firebasedemo/network_Manage/http_helper.dart';

import '../BaseUrl/baseurl.dart';

class LoginRepository {
  HttpHepler _loginHelper = HttpHepler();

  Future<LoginModel> loginRepoPost(Object requestBody) async {
    Map<String, dynamic> response = await _loginHelper.postApi(
        url: BaseUrl.loginApi,
        requestBody: requestBody,
        isRequireAuthorization: true);
    return LoginModel.fromJson(response);
  }
}

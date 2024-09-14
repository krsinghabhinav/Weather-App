import 'dart:convert';
import 'dart:io';

import 'package:firebasedemo/main.dart';
import 'package:firebasedemo/response/appExaption.dart';
import 'package:firebasedemo/utils/print_value.dart';
import 'package:firebasedemo/utils/toastMessage.dart';
import 'package:firebasedemo/view/WLoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../StorageHelper/storage_helper.dart';

class HttpHepler {
  Map<String, String> header(bool isRequireAuthorization) {
    if (isRequireAuthorization) {
      print(StorageHelper().getToken());
      return {
        'Authorization': 'Bearer ${StorageHelper().getToken()}',
        // "Authorization": "Bearer {your access token}"
        'Content-Type': 'application/json'
      };
    } else {
      return {'Content-Type': 'application/json'};
    }
  }

//getApi
  Future<dynamic> getApi(
      {required String url, bool isRequireAuthorization = false}) async {
    try {
      final apirespnse = await http.get(Uri.parse(url),
          headers: header(isRequireAuthorization));
      printvalue(url, tag: "Api Get url: ");
      printvalue(header(isRequireAuthorization), tag: "Api Header: ");
      printvalue(apirespnse.body, tag: "Api Response");
      return _requestResponse(apirespnse);
    } on SocketException {
      return null;
    }
  }

//post
  Future<dynamic> postApi(
      {required String url,
      Object? requestBody,
      bool isRequireAuthorization = false}) async {
    try {
      http.Response apiResponse;
      if (requestBody == null) {
        apiResponse = await http.post(Uri.parse(url),
            headers: header(isRequireAuthorization));
      } else {
        apiResponse = await http.post(
          Uri.parse(url),
          body: jsonEncode(requestBody),
          headers: header(isRequireAuthorization),
        );
      }
      printvalue(url, tag: "Api Get url: ");
      printvalue(header(isRequireAuthorization), tag: "Api Header: ");
      printvalue(apiResponse.body, tag: "Api Response ");
      printvalue(requestBody, tag: "Api Response body");
      return _requestResponse(apiResponse);
    } on SocketException {
      return null;
    }
  }

  //put
  Future<dynamic> putApi(
      {required String url,
      Object? requestBody,
      bool isRequireAuthorization = false}) async {
    try {
      http.Response apiResponse;
      if (requestBody == null) {
        apiResponse = await http.put(Uri.parse(url),
            headers: header(isRequireAuthorization));
      } else {
        apiResponse = await http.put(
          Uri.parse(url),
          body: jsonEncode(requestBody),
          headers: header(isRequireAuthorization),
        );
      }
      printvalue(url, tag: "Api Get url: ");
      printvalue(header(isRequireAuthorization), tag: "Api Header: ");
      printvalue(apiResponse.body, tag: "Api Response");
      printvalue(requestBody, tag: "Api Response body");
      return _requestResponse(apiResponse);
    } on SocketException {
      return null;
    }
  }

  //patch
  Future<dynamic> patchApi(
      {required String url,
      Object? requestBody,
      bool isRequireAuthorization = false}) async {
    try {
      http.Response apiResponse;
      if (requestBody == null) {
        apiResponse = await http.patch(Uri.parse(url),
            headers: header(isRequireAuthorization));
      } else {
        apiResponse = await http.patch(
          Uri.parse(url),
          body: jsonEncode(requestBody),
          headers: header(isRequireAuthorization),
        );
      }
      printvalue(url, tag: "Api Get url: ");
      printvalue(header(isRequireAuthorization), tag: "Api Header: ");
      printvalue(apiResponse.body, tag: "Api Response");
      printvalue(requestBody, tag: "Api Response body");
      return _requestResponse(apiResponse);
    } on SocketException {
      return null;
    }
  }

  //delete
  Future<dynamic> deleteApi(
      {required String url,
      Object? requestBody,
      bool isRequireAuthorization = false}) async {
    try {
      http.Response apiResponse;
      if (requestBody == null) {
        apiResponse = await http.delete(Uri.parse(url),
            headers: header(isRequireAuthorization));
      } else {
        apiResponse = await http.delete(
          Uri.parse(url),
          body: jsonEncode(requestBody),
          headers: header(isRequireAuthorization),
        );
      }
      printvalue(url, tag: "Api Get url: ");
      printvalue(header(isRequireAuthorization), tag: "Api Header: ");
      printvalue(apiResponse.body, tag: "Api Response");
      printvalue(requestBody, tag: "Api Response body");
      return _requestResponse(apiResponse);
    } on SocketException {
      return null;
    }
  }
}

dynamic _requestResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = jsonDecode(response.body);
      return responseJson;
    case 201:
      var responseJson = jsonDecode(response.body);
      return responseJson;

    case 400:
      var decodeError = jsonDecode(response.body);
      if (decodeError.containsKey('error')) {
        toastMessage(decodeError['error'].toString());
      }
      throw InvalidException;
    case 401:
      navigatorKey.currentState!.pushReplacement(
          MaterialPageRoute(builder: (context) => WLoginScreen()));
      throw ExceptionError("UnAuthorised url 401");

    case 500:
      throw Exception(
          "Error occure while communication with server with statusCode 500");

    default:
      throw Exception(
          "Error occure while communication with server with statusCode ${response.statusCode.toString()}");
  }
}

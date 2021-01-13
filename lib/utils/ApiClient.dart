import 'package:dio/dio.dart';
import 'package:flutter_mvp/Exception/ApiException.dart';
import 'dart:async';

import 'package:flutter_mvp/base/errorHander.dart';

class ApiClient{
  Error error;
  ApiClient({this.error});

  final String _baseUrl = "http://159.89.164.128:4200/";
  String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAxLCJpYXQiOjE2MDk0MDg5MzEsImV4cCI6MTY0MDk0NDkzMX0.WYFJN02kGlwDazStiXDzXBgGan1xsMHO4ooEBKTbWR4';
  Dio dio = Dio(
    BaseOptions(
      headers: {
        "x-access-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAxLCJpYXQiOjE2MDk0MDg5MzEsImV4cCI6MTY0MDk0NDkzMX0.WYFJN02kGlwDazStiXDzXBgGan1xsMHO4ooEBKTbWR4",
      },
    ),
  );

  Future<dynamic> api(String apiName,method,dynamic body)async{
    Response response;
    var responseJson;
    switch(method){
      case Method.POST:
        try {
          response = await dio.post(_baseUrl + apiName, data: body);
          print(response);
          responseJson = _returnResponse(response);
        }on DioError catch (e) {
          error.onErrorMsg(e.message);
          throw FetchDataException('Connection --> Failed');
        } break;
      case Method.GET:
        response = await dio.get(_baseUrl + apiName);
        break;
      case Method.PUT:
        response = await dio.put(_baseUrl + apiName, data: body);
        break;
      case Method.DELETE:
        response = await dio.delete(_baseUrl + apiName, data: body);
        break;
    }

    return responseJson;
  }

}

enum Method{POST,GET,DELETE,PUT}

dynamic _returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response;
    case 400:
      throw BadRequestException(response.data.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.statusCode);
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
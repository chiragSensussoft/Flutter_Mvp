import 'package:dio/dio.dart';
import 'package:flutter_mvp/base/BaseLoaderInterface.dart';
import 'dart:async';

import 'package:flutter_mvp/utils/BasePresenter.dart';

class ApiClient extends BasePresenter<BaseLoaderView>{
  BaseLoaderView _loaderView;

  ApiClient(this._loaderView);

  final String _baseUrl = "http://159.89.164.128:4200/";
  String token = 'yJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAxLCJpYXQiOjE2MDk0MDg5MzEsImV4cCI6MTY0MDk0NDkzMX0.WYFJN02kGlwDazStiXDzXBgGan1xsMHO4ooEBKTbWR4';
  Dio dio = Dio();

  Future<dynamic> api(String apiName,method,dynamic body)async{
    Response response;
    var responseJson;
    switch(method){
      case Method.POST:
        try {
          dio.options.headers['x-access-token'] = token;
          response = await dio.post(_baseUrl + apiName, data: body);
          responseJson = _returnResponse(response);
        }on DioError catch (e) {
          print("Catch => ${e.message}");
          responseJson = _returnResponse(e.response);
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

    return responseJson.toString();
  }

  String _returnResponse(Response response) {

    switch (response.statusCode) {
      case 200:
        return response.toString();
        break;

      case 400:
        _loaderView.onErrorLoad("Bad Request");
        break;

      case 401:
        _loaderView.onErrorLoad("Unauthorized");
        break;

      case 403:
        _loaderView.onErrorLoad("Forbidden");
        break;

      case 500:
        _loaderView.onErrorLoad("Internal Server Error");
        break;
      case 404:
          _loaderView.onErrorLoad("Error");
        break;

      default:
        _loaderView.onErrorLoad("Default Error");
        break;

    }
  }

}

enum Method{POST,GET,DELETE,PUT}


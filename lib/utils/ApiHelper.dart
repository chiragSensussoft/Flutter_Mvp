import 'package:dio/dio.dart';
import 'package:flutter_mvp/Exception/ApiException.dart';

ApiHelper apiManager = new ApiHelper();

class ApiHelper {
  static final ApiHelper _apiManager = new ApiHelper._internal();
  // ignore: non_constant_identifier_names
  String Base_URL = 'http://159.89.164.128:4200';
  String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAxLCJpYXQiOjE2MDk0MDg5MzEsImV4cCI6MTY0MDk0NDkzMX0.WYFJN02kGlwDazStiXDzXBgGan1xsMHO4ooEBKTbWR4';
  factory ApiHelper() {
    return _apiManager;
  }

  ApiHelper._internal();

  sendToServer() async {

    Dio dio = Dio(
      BaseOptions(
        headers: {
          "x-access-token": "$token",
        },
      ),
    );
    Response response;
    var responseJson;
    try {
      FormData formData = FormData.fromMap({'user_id':'Hy5W+98JqVh2m0NhBhC1zg==','page':'1'});
      response = await dio.post("$Base_URL/notificationList",
          data: formData,);
      print('Data ${response.statusCode}');
      responseJson = returnResponse(response);
    } on DioError catch (e) {
      if (e.response != null) {

        print('Response Data${e.response.data}');
      } else {
        print(e.message);
      }
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.data);
      case 401:
      case 403:
        throw UnauthorisedException(response.data);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response
                .statusCode}');
    }
  }

}
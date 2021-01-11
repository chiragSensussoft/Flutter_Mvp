import 'dart:async';

import 'package:http/http.dart' as http;

ApiHelper apiManager = new ApiHelper();

class ApiHelper {
  static final ApiHelper _apiManager = new ApiHelper._internal();

  factory ApiHelper() {
    return _apiManager;
  }

  ApiHelper._internal();

  Future fetchText() async {
    var response =
        await http.get("https://5fe9c2558ede8b0017ff0fb9.mockapi.io/api/user");
    return response;
  }
}
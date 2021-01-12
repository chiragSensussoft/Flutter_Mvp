import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_mvp/utils/api_base_helper.dart';
import 'package:flutter_mvp/utils/base_presentor.dart';

import 'home_page_Interface.dart';

class HomePagePresenter extends BasePresenter<HomePageView> {
  Future getText() async {
    Future.delayed(Duration(seconds: 12));
    Response response = await baseHelper.post('notificationList', {'user_id':'Hy5W+98JqVh2m0NhBhC1zg==','page':'1'});
    if (response.statusCode == 200) {
      // ignore: unnecessary_statements
      isViewAttached ? getView().onLoadText(response) : null;
    } else {
      // ignore: unnecessary_statements
      isViewAttached ? getView().onFailLoadText() : null;
    }
  }
}
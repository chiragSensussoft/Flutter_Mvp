import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_mvp/base/errorHander.dart';
import 'package:flutter_mvp/utils/ApiClient.dart';
import 'package:flutter_mvp/utils/base_presentor.dart';

import 'homeInterface.dart';

class HomePagePresenter extends BasePresenter<HomePageView> implements Error {
  HomePageView _view;
  ApiClient apiClient;

  getText() async {
    _view.showLoading();
    Future.delayed(Duration(seconds: 12));
    Response response = await apiClient.api('notificationList',Method.POST, {'user_id':'Hy5W+98JqVh2m0NhBhC1zg==','page':'1'});
    if (response.statusCode == 200) {
      isViewAttached ? getView().onLoadText(response) : null;
      _view.hideLoading();
    } else {
      // isViewAttached ? getView().onFailLoadText() : null;
      _view.hideLoading();
    }
  }

  HomePagePresenter(HomePageView view){
    _view = view;
    apiClient = ApiClient(error: this);

  }

  @override
  onErrorMsg(String msg) {
    _view.onFailLoadText(msg);
  }

}
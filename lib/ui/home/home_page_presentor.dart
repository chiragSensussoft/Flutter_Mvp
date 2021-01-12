import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_mvp/utils/api_base_helper.dart';
import 'package:flutter_mvp/utils/base_presentor.dart';

import 'home_page_Interface.dart';

class HomePagePresenter extends BasePresenter<HomePageView> {
  HomePageView _view;

  getText() async {
    _view.showLoading();
    Future.delayed(Duration(seconds: 12));
    Response response = await baseHelper.api('notificationList',Method.POST, {'user_id':'Hy5W+98JqVh2m0NhBhC1zg==','page':'1'});
    if (response.statusCode == 200) {
      isViewAttached ? getView().onLoadText(response) : null;
      _view.hideLoading();
    } else {
      isViewAttached ? getView().onFailLoadText() : null;
      _view.hideLoading();
    }
  }

  HomePagePresenter(HomePageView view){
    _view = view;
  }
}
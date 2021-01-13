import 'dart:convert';
import 'package:flutter_mvp/utils/ApiClient.dart';
import 'package:flutter_mvp/utils/BasePresenter.dart';

import 'OnHomeView.dart';

class HomePagePresenter extends BasePresenter<OnHomeView>{
  OnHomeView _view;
  ApiClient apiClient;

  getText() async {
    _view.showLoading();
    var response = await apiClient.api('notificationList',Method.POST, {'user_id':'Hy5W+98JqVh2m0NhBhC1zg==','page':'1'});
    dynamic text = json.decode(response);

    if (text['status'] == true) {
      isViewAttached ? getView().onResponseLoad(text['data']) : null;
      _view.hideLoading();
    } else {
      isViewAttached ? getView().onErrorLoad(response) : null;
      _view.hideLoading();
    }
  }

  HomePagePresenter(OnHomeView view){
    _view = view;
    apiClient = ApiClient(_view);
  }

}
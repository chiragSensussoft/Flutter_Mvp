import 'dart:async';

import 'package:flutter_mvp/data/network/ApiHelper.dart';
import 'package:flutter_mvp/ui/base/base_presentor.dart';
import 'package:flutter_mvp/utils/network_utils.dart';

import 'home_page_Interface.dart';


class HomePagePresenter extends BasePresenter<HomePageView> {
  Future getText() async {
    Future.delayed(Duration(seconds: 12));
    var response = await apiManager.fetchText();
    if (NetworkUtils.isReqSuccess(response)) {
      String text = response.body.toString();
      // ignore: unnecessary_statements
      isViewAttached ? getView().onLoadText(text) : null;
    } else {
      // ignore: unnecessary_statements
      isViewAttached ? getView().onFailLoadText() : null;
    }
  }
}
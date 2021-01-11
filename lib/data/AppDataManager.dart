import 'package:flutter_mvp/data/network/ApiHelper.dart';

AppDataManager appDataManager = new AppDataManager();

class AppDataManager {
  static final AppDataManager _appDataManager = new AppDataManager._internal();
  final ApiHelper apiHelper = new ApiHelper();

  factory AppDataManager() {
    return _appDataManager;
  }

  AppDataManager._internal();
}
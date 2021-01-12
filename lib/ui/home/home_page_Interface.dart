
import 'package:flutter_mvp/base/BaseLoaderInterface.dart';
import 'package:flutter_mvp/base/errorHander.dart';

abstract class HomePageView extends BaseLoaderView with Error{
  onLoadText(text);
  onFailLoadText() {}
}
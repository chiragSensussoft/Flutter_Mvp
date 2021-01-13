
import 'package:flutter_mvp/base/BaseLoaderInterface.dart';

abstract class HomePageView extends BaseLoaderView{
  onLoadText(text);
  onFailLoadText(String msg) {}
}
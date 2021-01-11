
import 'package:flutter_mvp/data/network/BaseLoaderInterface.dart';

abstract class HomePageView extends BaseLoaderView{
  onLoadText(String text);
  onFailLoadText() {}
}
import 'package:flutter/material.dart';
import 'package:flutter_mvp/ui/home_page_Interface.dart';

import 'home_page_presentor.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomePageView {

  String _text="Loading...";

  HomePagePresenter _presentor;

  @override
  void initState() {
    super.initState();
    _presentor=new HomePagePresenter();
    _presentor.attachView(this);
    _presentor.getText();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MVP app"),
      ),
      body: new Center(
        child: new Text(_text,style: new TextStyle(fontSize: 18.0),),
      ),
    );
  }

  @override
  onLoadText(String text) {
    setState(() {
      _text=text;
    });
  }

  @override
  onFailLoadText() {
    setState(() {
      _text="Failed";
    });
  }

  @override
  hideLoading() {
    // TODO: implement hideLoading
  }

  @override
  showLoading() {
    // TODO: implement showLoading
  }
}

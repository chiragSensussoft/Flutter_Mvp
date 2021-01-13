import 'package:flutter/material.dart';
import 'package:flutter_mvp/Notification.dart';
import 'package:flutter_mvp/ui/home/homeInterface.dart';
import 'package:flutter_mvp/utils/ApiClient.dart';

import 'homePresenter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomePageView{

  String _text="Loading...";

  HomePagePresenter _presentor;
  bool dialog;
  ApiClient _baseHelper;
  @override
  void initState() {
    super.initState();
    _presentor = HomePagePresenter(this);
    _presentor.attachView(this);
    _presentor.getText();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("MVP app"),
      ),
      body:  Center(
        child:  dialog == false ? ListView.builder(
          itemCount: notificationList.length,
          itemBuilder: (_,index){
            return Text(notificationList[index].id,style: new TextStyle(fontSize: 18.0),);
          },
        ): CircularProgressIndicator(backgroundColor: Colors.yellow,)
      ),
    );
  }

  List<Datum> notificationList = List();

  @override
  onLoadText(text) {
    setState(() {

      List<dynamic> data = text.data['data'];
      setState(() {
        notificationList.addAll(data.map((e) => Datum.fromJson(e)).toList());
      });
    });
  }

  @override
  onFailLoadText(String msg) {
    print("ErrorLoadText --> $msg");
  }

  @override
  hideLoading() {
    setState(() {
      dialog = false;
    });
  }

  @override
  showLoading() {
    dialog = true;
  }
}

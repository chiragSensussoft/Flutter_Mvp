import 'package:flutter/material.dart';
import 'package:flutter_mvp/ui/home/model/Notification.dart';
import 'package:flutter_mvp/ui/home/OnHomeView.dart';
import 'package:flutter_mvp/utils/Toast.dart';

import 'homePresenter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements OnHomeView{

  HomePagePresenter _presenter;
  bool dialog;
  @override
  void initState() {
    super.initState();
    _presenter = HomePagePresenter(this);
    _presenter.attachView(this);
    _presenter.getText();
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
  onResponseLoad(text) {
    setState(() {
      List<dynamic> data = text;
      setState(() {
        notificationList.addAll(data.map((e) => Datum.fromJson(e)).toList());
      });
    });
  }

  @override
  onErrorLoad(msg) {
    Toast toast = Toast();
    toast.overLay = false;
    toast.showOverLay(msg, Colors.white, Colors.black54, context);
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

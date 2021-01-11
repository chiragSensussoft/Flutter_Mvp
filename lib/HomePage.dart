import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvp/Notification.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Notifications>> notifications;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: NotificationBoxList(),
      ),
    );
  }

  List<Notifications> parseNotifications(String responseBody) {
    // final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    final jsonResponse = json.decode(responseBody);
    print(jsonResponse[0]['data']);
    // return parsed.map<Notifications>((json) => Notifications.fromJson(json)).toList();
  }

  Future<List<Notifications>> fetchProducts() async {

    // http.post(url, headers: {"x-access-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAxLCJpYXQiOjE2MDk0MDg5MzEsImV4cCI6MTY0MDk0NDkzMX0.WYFJN02kGlwDazStiXDzXBgGan1xsMHO4ooEBKTbWR4"}).then(
    //     (http.Response response){
    //       print('ResPonse =>>>>> ${response.body[0]} Status Code ${response.statusCode}');
    //       if (response.statusCode == 200) {
    //         return parseProducts(response.body);
    //       } else {
    //         throw Exception('Unable to fetch products from the REST API');
    //       }
    //     });

    // var uri = Uri.parse('http://159.89.164.128:4200/notificationList');
    // var request = new http.MultipartRequest("POST", uri);
    // request.fields["user_id"] = "Hy5W+98JqVh2m0NhBhC1zg==";
    // request.fields['page'] = '1';
    // request.headers['x-access-token'] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAxLCJpYXQiOjE2MDk0MDg5MzEsImV4cCI6MTY0MDk0NDkzMX0.WYFJN02kGlwDazStiXDzXBgGan1xsMHO4ooEBKTbWR4";
    // var data;
    // request.send().then((value) => {
    //   // json.decode(value.reasonPhrase),
    //   print(value.stream)
    // });



    var uri = Uri.parse("http://159.89.164.128:4200/notificationList");
    var request = new http.MultipartRequest("POST", uri);
    request.fields["user_id"] = "Hy5W+98JqVh2m0NhBhC1zg==";
    request.fields["page"] = "1";
    request.headers["x-access-token"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAxLCJpYXQiOjE2MDk0MDg5MzEsImV4cCI6MTY0MDk0NDkzMX0.WYFJN02kGlwDazStiXDzXBgGan1xsMHO4ooEBKTbWR4";
    var data;

    await request.send().then((response) async {
      response.stream.transform(utf8.decoder).listen((value) {
        // print(value);
        data = json.decode(value);
      });
    }).catchError((e) {
      print(e);
    });
    print('Data ${data['data']['id']}');
    // final http.Response response = await http.post(
    //   request.url,
    //   headers: request.headers,
    //   body: request.fields,
    // );
    // print(response.statusCode);
    // if (response.statusCode == 200) {
    //   // If the server did return a 201 CREATED response,
    //   // then parse the JSON.
    //   print(response.body);
    //   // return Album.fromJson(jsonDecode(response.body));
    // } else {
    //   // If the server did not return a 201 CREATED response,
    //   // then throw an exception.
    //   throw Exception('Failed to load album');
    // }

  }
}

class NotificationBoxList extends StatelessWidget {
  List<Notifications> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Text(items[index].data[index].id.toString()),
          onTap: () {
          },
        );
      },
    );
  }
}
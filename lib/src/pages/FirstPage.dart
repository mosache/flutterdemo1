import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterdemo1/src/utils/URLPath.dart';
import 'BasePage.dart';
import 'package:dio/dio.dart';
import '../../views/MyAppBar.dart';

class FirstPage extends BasePage {
  @override
  State<StatefulWidget> getState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'hehe',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                )
              ],
            ),
          ),
          bottomOpacity: 0,
        ),
        body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Container(
              padding: EdgeInsets.all(0),
              child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'hehe',
                                      labelStyle: TextStyle(
                                          fontSize: 22, color: Colors.yellow),
                                      alignLabelWithHint: true,
                                    ),
                                    cursorColor: Colors.green,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            )));
  }

  @override
  void initState() {
    super.initState();
    _login().then((data) {
      var model = json.decode(data);
      print(model.runtimeType);
    });
  }}

  Future _login() async {
    try {
      var dio = Dio();
      Response response;
      response = await dio.post(URLPath['login'], queryParameters: {
        'user_name': '15000095010',
        'password': '96e79218965eb72c92a549dd5a330112'.toUpperCase(),
        'equip_no': '2',
        'type': '2',
        'phone_model': '2'
      });
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  //自定义titleView
  Widget _getTitleView(String title) {
    return Center(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title,style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }


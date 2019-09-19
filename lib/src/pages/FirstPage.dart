import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterdemo1/src/utils/URLPath.dart';
import 'BasePage.dart';
import 'package:dio/dio.dart';
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
        body:Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Container(
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'FirstPage',
                          style: TextStyle(
                              fontSize: 40, decoration: TextDecoration.none),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          color: Colors.amberAccent,
                          highlightColor: Colors.grey,
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 22),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context,'/second');
                          },
                        )
                      ],
                    ),
                  )),
            ))
    );;
  }

  @override
  void initState() {
    super.initState();
    _Login().then((data){
      var model = json.decode(data);
      print(model.runtimeType);
    });
  }

  Future _Login() async {
    try {
      var dio = Dio();
      Response response;
      response = await dio.post(URLPath['login'],queryParameters:{'user_name':'15000095010','password':'96e79218965eb72c92a549dd5a330112'.toUpperCase(),'equip_no':'2','type':'2','phone_model':'2'});
      return response.data;
    }catch (e){
      print(e);
    }
  }
}


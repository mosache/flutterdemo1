import 'package:flutter/material.dart';
import 'package:flutterdemo1/src/pages/BasePage.dart';

class SecondPage extends BasePage {
  @override
  State<StatefulWidget> getState() {
    return SecondPageState();
  }

}

class SecondPageState extends State<SecondPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Text('SecondPage',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ))
    );;
  }
}
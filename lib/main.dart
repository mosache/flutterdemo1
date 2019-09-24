import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo1/src/pages/MainPage.dart';
import 'src/pages/FirstPage.dart';
import 'src/pages/MainPage.dart';
import 'src/pages/SecondPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'heh',
      initialRoute: '/',
      routes: {'/': (ctx) => MainPage(), '/second': (ctx) => SecondPage()},
    );
  }
}



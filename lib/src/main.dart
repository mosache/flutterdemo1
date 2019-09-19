import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pages/FirstPage.dart';
import './pages/SecondPage.dart';
import './utils/URLPath.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'heh',
      initialRoute: '/',
      routes: {'/': (ctx) => FirstPage(), '/second': (ctx) => SecondPage()},
    );
  }
}




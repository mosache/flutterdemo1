import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'src/pages/FirstPage.dart';
import 'src/pages/SecondPage.dart';

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




import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget{

  State getState();

  @override
  State createState() {
    return getState();
  }
}

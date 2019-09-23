import 'package:flutter/material.dart';
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {

  final Color backgroundColor;
  final double height;
  final Widget titleView;
  final List<Widget> rightViews;

  MyAppBar({this.backgroundColor,this.height,this.titleView,this.rightViews}) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppBarState(titleView: titleView);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _MyAppBarState extends State<MyAppBar> {
  final Widget titleView;
  final List<Widget> rightViews;

  _MyAppBarState({this.titleView,this.rightViews}) : super();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: titleView,),
            Text('jeje')
          ],
        )

      ),
    );

  }

}


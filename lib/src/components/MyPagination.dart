import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterdemo1/src/components/PageIndicator.dart';

class MyPagination extends StatefulWidget {

  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final double pageHeight;
  const MyPagination(
      {
      this.paddingLeft = 0,
      this.paddingRight = 0,
      this.paddingTop = 0,
      this.paddingBottom = 0,
      this.pageHeight = 10
      })
      : super();

  @override
  _MyPaginationState createState() => _MyPaginationState();
}

class _MyPaginationState extends State<MyPagination> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(widget.paddingLeft, widget.paddingTop,
              widget.paddingRight, widget.paddingBottom),
          child: Row(
            children: <Widget>[
              Container(
                width: ScreenUtil.instance.setWidth(720) - widget.paddingLeft - widget.paddingRight,
                height: widget.pageHeight,
                child: CustomPaint(painter: _PagePainter(),),
              )
            ],
          ),
        ));
  }
}

///
class _PagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill
    ..strokeWidth = 2;

    ///先画中间的方框
    canvas.drawRect(Rect.fromCenter(center: Offset(size.width / 2, size.height / 2),width: 10,height: 3), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}

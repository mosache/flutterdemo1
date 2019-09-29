import 'package:flutter/material.dart';
class MyPaintView extends StatefulWidget {
  MyPaintView({Key key}) : super(key: key);

  _MyPaintViewState createState() => _MyPaintViewState();
}

class _MyPaintViewState extends State<MyPaintView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
         child: CustomPaint(painter: DemoPainter()),
       ),
    );
  }
}

class DemoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var p = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill
    ..strokeWidth = 2;
    // canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), p);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, p);
  }

  @override
  bool shouldRepaint(DemoPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(DemoPainter oldDelegate) => false;
}
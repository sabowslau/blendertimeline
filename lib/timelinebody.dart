import 'package:flutter/material.dart';

class TimeLineBody extends StatelessWidget {
  const TimeLineBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: TimeLinePainter(),
      ),
    );
  }
}

class TimeLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(TimeLinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TimeLinePainter oldDelegate) => false;
}

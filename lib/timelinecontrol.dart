import 'package:flutter/material.dart';
import 'package:timeline/timehead.dart';

class TimeLineControl extends StatelessWidget {
  const TimeLineControl({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      height: 100,
      child: Column(
        children: [
          TimelineHeader(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:timeline/slidecontrol.dart';
import 'timelinemodel.dart';

class TimelineHeader extends StatelessWidget {
  const TimelineHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = ScopedModel.of<TimeLineModel>(context, rebuildOnChange: true);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (model.isPlaying) PauseButton(),
          if (!model.isPlaying) ReverseButton(),
          if (!model.isPlaying) PlayButton(),
          TimeLineCurrentFrameControl(),
        ],
      ),
    );
  }
}

class PauseButton extends StatelessWidget {
  const PauseButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = ScopedModel.of<TimeLineModel>(context);
    return Tooltip(
      message: "Pause Animation",
      child: Container(
        width: 50,
        margin: EdgeInsets.all(1),
        color: Colors.grey,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Icon(
              Icons.pause,
              color: Colors.white,
            ),
            onTap: () {
              model.pause();
            },
          ),
        ),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = ScopedModel.of<TimeLineModel>(context);
    return Tooltip(
      message: "Play Animation",
      child: Container(
        margin: EdgeInsets.all(1),
        color: Colors.grey,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
            onTap: () {
              model.playForward();
            },
          ),
        ),
      ),
    );
  }
}

class ReverseButton extends StatelessWidget {
  const ReverseButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = ScopedModel.of<TimeLineModel>(context);
    return Tooltip(
      message: "Reverse Animation",
      child: Container(
        margin: EdgeInsets.all(1),
        color: Colors.grey,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Icon(
              Icons.arrow_left,
              color: Colors.white,
            ),
            onTap: () {
              model.playBackwards();
            },
          ),
        ),
      ),
    );
  }
}

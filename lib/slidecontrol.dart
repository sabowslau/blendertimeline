import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'timelinemodel.dart';

class TimeLineCurrentFrameControl extends StatefulWidget {
  const TimeLineCurrentFrameControl({Key key}) : super(key: key);

  @override
  _TimeLineCurrentFrameControlState createState() =>
      _TimeLineCurrentFrameControlState();
}

class _TimeLineCurrentFrameControlState
    extends State<TimeLineCurrentFrameControl> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          onHover = value;
        });
      },
      child: Container(
        width: 120,
        child: Row(
          children: [
            PreviusFrame(
              onHover: onHover,
            ),
            SlideControl(),
            NextFrame(
              onHover: onHover,
            ),
          ],
        ),
      ),
    );
  }
}

class PreviusFrame extends StatefulWidget {
  final bool onHover;
  const PreviusFrame({Key key, this.onHover: false}) : super(key: key);

  @override
  _PreviusFrameState createState() => _PreviusFrameState();
}

class _PreviusFrameState extends State<PreviusFrame> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    var model = ScopedModel.of<TimeLineModel>(context);
    return Container(
      color: onHover ? Colors.grey.shade500 : Colors.grey.shade600,
      child: InkWell(
        onHover: (state) {
          setState(() {
            onHover = state;
          });
        },
        child: Icon(
          Icons.keyboard_arrow_left,
          color: widget.onHover ? Colors.white : Colors.grey.shade600,
        ),
        onTap: () {
          model.previusFrame();
        },
      ),
    );
  }
}

class NextFrame extends StatefulWidget {
  final bool onHover;
  const NextFrame({Key key, this.onHover: false}) : super(key: key);

  @override
  _NextFrameState createState() => _NextFrameState();
}

class _NextFrameState extends State<NextFrame> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    var model = ScopedModel.of<TimeLineModel>(context);
    return Container(
      color: onHover ? Colors.grey.shade500 : Colors.grey.shade600,
      child: InkWell(
        onHover: (state) {
          setState(() {
            onHover = state;
          });
        },
        child: Icon(
          Icons.keyboard_arrow_right,
          color: widget.onHover ? Colors.white : Colors.grey.shade600,
        ),
        onTap: () {
          model.nextFrame();
        },
      ),
    );
  }
}

class SlideControl extends StatefulWidget {
  const SlideControl({Key key}) : super(key: key);

  @override
  _SlideControlState createState() => _SlideControlState();
}

class _SlideControlState extends State<SlideControl> {
  bool editingText = false;
  @override
  Widget build(BuildContext context) {
    var model = ScopedModel.of<TimeLineModel>(context, rebuildOnChange: true);

    void handlePanUpdate(DragUpdateDetails details) {
      if (details.delta.dx > 0) {
        model.nextFrame();
      } else {
        model.previusFrame();
      }
    }

    return editingText
        ? Container(
            color: Colors.grey.shade600,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "",
                contentPadding: EdgeInsets.all(0),
              ),
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 22),
              onSaved: (newVal) {
                setState(() {
                  int newFrame = int.tryParse(newVal);
                  model.setFrame(newFrame);
                  editingText = false;
                });
              },
              onFieldSubmitted: (newVal) {
                setState(() {
                  int newFrame = int.tryParse(newVal);
                  model.setFrame(newFrame);
                  editingText = false;
                });
              },
            ),
            width: 50,
          )
        : GestureDetector(
            onHorizontalDragUpdate: handlePanUpdate,
            onTap: () {
              setState(() {
                editingText = !editingText;
              });
            },
            child: Container(
              color: Colors.grey.shade600,
              width: 50,
              child: Text(
                model.currentFrame.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}

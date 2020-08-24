import 'dart:async';

import 'package:scoped_model/scoped_model.dart';

class TimeLineModel extends Model {
  bool isPlaying = false;
  bool playForwardDirection = true;

  int currentFrame = 0;
  int startFrame = 1;
  int endFrame = 250;

  int frameRate = 30;
  int frameDuration;

  void incrementalFrame() {
    frameDuration = 50;
    Timer.periodic(Duration(milliseconds: frameDuration), (timer) {
      if (currentFrame < endFrame) {
        currentFrame++;
      } else {
        currentFrame = startFrame;
      }
      if (!isPlaying) timer.cancel();
      notifyListeners();
    });
  }

  void decreaseFrame() {
    frameDuration = 50;
    Timer.periodic(Duration(milliseconds: frameDuration), (timer) {
      if (currentFrame > startFrame) {
        currentFrame--;
      } else {
        currentFrame = endFrame;
      }
      if (!isPlaying) timer.cancel();
      notifyListeners();
    });
  }

  void playForward() {
    isPlaying = true;
    playForwardDirection = true;
    incrementalFrame();
    notifyListeners();
  }

  void playBackwards() {
    isPlaying = true;
    playForwardDirection = false;
    decreaseFrame();
    notifyListeners();
  }

  void pause() {
    isPlaying = false;
    notifyListeners();
  }

  void nextFrame() {
    if (currentFrame < endFrame) {
      currentFrame++;
    } else {
      currentFrame = 0;
    }

    notifyListeners();
  }

  void previusFrame() {
    if (currentFrame > startFrame) {
      currentFrame--;
    } else {
      currentFrame = endFrame;
    }

    notifyListeners();
  }

  void setFrame(int newFrame) {
    if (newFrame != null) {
      currentFrame = newFrame;
      notifyListeners();
    }
  }
}

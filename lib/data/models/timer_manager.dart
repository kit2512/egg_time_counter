import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerManager extends ChangeNotifier {
  static const Duration period = Duration(seconds: 1);
  Timer? _timer;

  Duration duration;
  Duration currentDuration;
  bool isStarted = false;

  TimerManager({required this.duration}) : currentDuration = duration;

  String get stringDuration => _formatDuration(currentDuration);
  double get remainingRatio => currentDuration.inSeconds / duration.inSeconds;

  void start() {
    if (currentDuration != const Duration()) {
      isStarted = true;
      notifyListeners();

      _timer = Timer.periodic(period, (timer) {
        currentDuration = currentDuration - period;
        if (currentDuration == const Duration()) {
          timer.cancel();
        }
        notifyListeners();
      });
    }
  }

  void pause() {
    isStarted = false;
    if (_timer != null) {
      _timer!.cancel();
    }
    notifyListeners();
  }

  void reset() {
    isStarted = false;
    if (_timer != null) {
      _timer!.cancel();
    }
    currentDuration = duration;
    notifyListeners();
  }

  String _formatDuration(Duration duration) {
    if (duration == const Duration()) {
      return "Over!";
    } else {
      return duration.toString().split(".").first;
    }
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }
}

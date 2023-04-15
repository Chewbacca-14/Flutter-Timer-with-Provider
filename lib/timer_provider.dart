import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  Timer? _timer;
  int _minute = 0;
  int _hour = 0;
  int _seconds = 0;
  bool _startEnable = true;
  bool _stopEnable = false;
  bool _continueEnable = false;
  bool _resetEnable = false;

  int get minute => _minute;
  int get hour => _hour;
  int get seconds => _seconds;
  bool get startEnable => _startEnable;
  bool get stopEnable => _stopEnable;
  bool get continueEnable => _continueEnable;
  bool get resetEnable => _resetEnable;

  void start() {
    _hour = 0;
    _minute = 0;
    _seconds = 0;
    _startEnable = false;
    _stopEnable = true;
    _continueEnable = false;
    _resetEnable = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds < 59) {
        _seconds++;
      } else if (_seconds == 59) {
        _seconds = 0;

        if (_minute == 59) {
          _hour++;
          _minute = 0;
        } else {
          _minute++;
        }
      }
      notifyListeners();
    });
  }

  void stop() {
    if (_startEnable == false) {
      _startEnable = true;
      _stopEnable = false;
      _continueEnable = true;
      _resetEnable = true;
      _timer!.cancel();
    }
    notifyListeners();
  }

  void continueTimer() {
    _startEnable = false;
    _stopEnable = true;
    _continueEnable = false;
    _resetEnable = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds < 59) {
        _seconds++;
      } else if (_seconds == 59) {
        _seconds = 0;

        if (_minute == 59) {
          _hour++;
          _minute = 0;
        } else {
          _minute++;
        }
      }
      notifyListeners();
    });
  }

  void resetTimer() {
    _hour = 0;
    _minute = 0;
    _seconds = 0;
    _startEnable = true;
    _stopEnable = false;
    _continueEnable = false;
    _resetEnable = false;
    notifyListeners();
  }
}

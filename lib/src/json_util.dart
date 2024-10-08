import 'dart:async';

/// Timer callback (millisUntilFinished in milliseconds).
typedef OnTimerTickCallback = void Function(int millisUntilFinished);

/// TimerUtil.
class TimerUtil {
  TimerUtil(
      {this.mInterval = Duration.millisecondsPerSecond, this.mTotalTime = 0});

  /// Timer.
  Timer? _mTimer;

  /// Is Timer active.
  bool _isActive = false;

  /// Timer interval (unit: milliseconds, default: 1000 milliseconds).
  int mInterval;

  /// Countdown total time (unit: milliseconds).
  int mTotalTime; // unit: milliseconds

  OnTimerTickCallback? _onTimerTickCallback;

  /// Set Timer interval (unit: milliseconds).
  void setInterval(int interval) {
    if (interval <= 0) interval = Duration.millisecondsPerSecond;
    mInterval = interval;
  }

  /// Set countdown total time (unit: milliseconds).
  void setTotalTime(int totalTime) {
    if (totalTime <= 0) return;
    mTotalTime = totalTime;
  }

  /// Start the Timer.
  void startTimer() {
    if (_isActive || mInterval <= 0) return;
    _isActive = true;
    Duration duration = Duration(milliseconds: mInterval);
    _doCallback(0);
    _mTimer = Timer.periodic(duration, (Timer timer) {
      _doCallback(timer.tick);
    });
  }

  /// Start the countdown Timer.
  void startCountDown() {
    if (_isActive || mInterval <= 0 || mTotalTime <= 0) return;
    _isActive = true;
    Duration duration = Duration(milliseconds: mInterval);
    _doCallback(mTotalTime);
    _mTimer = Timer.periodic(duration, (Timer timer) {
      int time = mTotalTime - mInterval;
      mTotalTime = time;
      if (time >= mInterval) {
        _doCallback(time);
      } else if (time == 0) {
        _doCallback(time);
        cancel();
      } else {
        timer.cancel();
        Future.delayed(Duration(milliseconds: time), () {
          mTotalTime = 0;
          _doCallback(0);
          cancel();
        });
      }
    });
  }

  void _doCallback(int time) {
    if (_onTimerTickCallback != null) {
      _onTimerTickCallback!(time);
    }
  }

  /// Update countdown total time.
  void updateTotalTime(int totalTime) {
    cancel();
    mTotalTime = totalTime;
    startCountDown();
  }

  /// Check if the timer is active.
  bool isActive() {
    return _isActive;
  }

  /// Cancel the timer.
  void cancel() {
    _mTimer?.cancel();
    _mTimer = null;
    _isActive = false;
  }

  /// Set the timer callback.
  void setOnTimerTickCallback(OnTimerTickCallback callback) {
    _onTimerTickCallback = callback;
  }
}

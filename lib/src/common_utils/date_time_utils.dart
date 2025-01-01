class DateTimeUtils {
  /// ex: 05:12,  */
  static String getTimeString(Duration time) {
    final minutes = _twoDigits(time.inMinutes.remainder(Duration.minutesPerHour));
    final seconds = _twoDigits(time.inSeconds.remainder(Duration.secondsPerMinute));

    final hours = time.inHours > 0 ? '${time.inHours}:' : '';
    return "$hours$minutes:$seconds";
  }

  static String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}

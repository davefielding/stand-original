import 'package:flutter/material.dart';

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");

  int seconds = duration.inSeconds;
  String twoDigitSeconds = twoDigits(seconds.remainder(60));

  if (seconds <= 60) return '${twoDigitSeconds}s';

  int minutes = duration.inMinutes;
  String twoDigitMinutes = twoDigits(minutes.remainder(60));

  return '${twoDigitMinutes}m ${twoDigitSeconds}s';
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay addMinutes(int minutes) {
    if (minutes == 0) {
      return this;
    } else {
      int minutesOfDay = this.hour * 60 + this.minute;
      int newMinutesOfDay = ((minutes % 1440) + minutesOfDay + 1440) % 1440;
      if (minutesOfDay == newMinutesOfDay) {
        return this;
      } else {
        int newHour = newMinutesOfDay ~/ 60;
        int newMinute = newMinutesOfDay % 60;
        return TimeOfDay(hour: newHour, minute: newMinute);
      }
    }
  }
}

import 'package:flutter/material.dart';

import 'attendee.dart';

class StandUp {
  final List<Attendee> attendees;
  String name;
  TimeOfDay startTime;
  Duration maxDurationForEachAttendee;

  StandUp({@required this.name, @required this.startTime, @required this.maxDurationForEachAttendee, this.attendees});
}

class StandUps {
  static StandUp defaultStandUp() {
    return StandUp(
      name: 'FX eCom EMEA Stand Up',
      startTime: TimeOfDay(hour: 10, minute: 00),
      maxDurationForEachAttendee: Duration(seconds: 45),
      attendees: [
        Attendee(name: 'Dave', location: 'London'),
        Attendee(name: 'Ioannis', location: 'London'),
        Attendee(name: 'Elian', location: 'London'),
        Attendee(name: 'Siri', location: 'London'),
        Attendee(name: 'Andrada', location: 'London'),
        Attendee(name: 'Brad', location: 'London'),
        Attendee(name: 'Melinda', location: 'London'),
        Attendee(name: 'Alexey', location: 'London'),
        Attendee(name: 'Serena', location: 'London'),
        Attendee(name: 'Baur', location: 'London'),
        Attendee(name: 'Graham', location: 'London'),
        Attendee(name: 'Yousaf', location: 'London'),
        Attendee(name: 'Pawel', location: 'London'),
        Attendee(name: 'Lax', location: 'London'),
      ],
    );
  }
}

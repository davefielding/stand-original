import 'package:flutter/material.dart';
import 'package:standup_attempt1/constants/standup_icons.dart';
import 'package:standup_attempt1/data/stand_up.dart';
import 'package:standup_attempt1/widgets/current_attendee_card.dart';
import 'package:standup_attempt1/widgets/item_card.dart';

class StandUpPlayerView extends StatefulWidget {
  final StandUp standUp;

  StandUpPlayerView({@required this.standUp});

  @override
  _StandUpPlayerViewState createState() => _StandUpPlayerViewState();
}

class _StandUpPlayerViewState extends State<StandUpPlayerView> {
  int currentAttendeeIndex = 0;

  int getNextAttendee() {
    this.currentAttendeeIndex = (1 + this.currentAttendeeIndex) % (this.widget.standUp.attendees.length -1);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.widget.standUp.name)),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: CurrentAttendeeItemCard(
                attendee: this.widget.standUp.attendees[this.currentAttendeeIndex],
                timeRemaining: this.widget.standUp.maxDurationForEachAttendee,
                onZeroTimeLeft: () {
                  setState(() { this.getNextAttendee();});
                },
              ),
            ),
            Expanded(
              child: ItemCard(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(child: Icon(StandUpIcons.pause),),
                MaterialButton(child: Icon(StandUpIcons.next),),
                MaterialButton(child: Icon(StandUpIcons.cancel),),
              ],
            ),
          ),),
      ),
    );
  }
}

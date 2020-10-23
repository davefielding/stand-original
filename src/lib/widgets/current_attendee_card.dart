import 'package:flutter/material.dart';
import 'package:standup_attempt1/constants/styles.dart';
import 'package:standup_attempt1/data/attendee.dart';
import 'package:standup_attempt1/widgets/countdown_timer.dart';
import 'package:standup_attempt1/widgets/item_card.dart';

class CurrentAttendeeItemCard extends StatelessWidget {
  final Attendee attendee;
  final Duration timeRemaining;
  final Function onZeroTimeLeft;

  CurrentAttendeeItemCard({this.attendee, this.timeRemaining, this.onZeroTimeLeft});

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NOW',
            style: kLabelTextStyle,
          ),
          SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(this.attendee.name, style: kLabelDataStyle),
                        Text(' - ${this.attendee.location}',
                            style: kLabelSubDataStyle),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: /*Text(formatDuration(this.timeRemaining, style: kLabelDataStyle),),*/
                CountDownTimer(
                  secondsRemaining: this.timeRemaining.inSeconds,
                  countDownTimerStyle: kLabelDataStyle,
                  whenTimeExpires: this.onZeroTimeLeft,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

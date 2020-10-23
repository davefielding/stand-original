import 'package:flutter/material.dart';
import 'package:standup_attempt1/constants/standup_icons.dart';
import 'package:standup_attempt1/constants/styles.dart';
import 'package:standup_attempt1/widgets/item_card.dart';
import 'package:standup_attempt1/widgets/round_icon_button.dart';

class UpDownItemCard extends StatelessWidget {
  final String title;
  final String value;
  final Function onPlusPressed;
  final Function onMinusPressed;

  UpDownItemCard({this.title, this.value, this.onPlusPressed, this.onMinusPressed});

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: StandUpIcons.minus,
              onPressed: this.onMinusPressed,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(this.title.toUpperCase(), style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(this.value, style: kLabelTextStyle),
                  ],
                )
              ],
            ),
            RoundIconButton(
              icon: StandUpIcons.plus,
              onPressed: this.onPlusPressed,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:standup_attempt1/application_theme.dart';
import 'package:standup_attempt1/constants/standup_icons.dart';
import 'package:standup_attempt1/extensions/duration_extensions.dart';
import 'package:standup_attempt1/data/stand_up.dart';
import 'package:standup_attempt1/pages/stand_up_player_view.dart';
import 'package:standup_attempt1/widgets/attendee_tile.dart';
import 'package:standup_attempt1/widgets/up_down_card.dart';

class StandUpView extends StatefulWidget {
  StandUpView(this._standUp);

  final StandUp _standUp;

  @override
  _StandUpViewState createState() => _StandUpViewState();
}

class _StandUpViewState extends State<StandUpView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationTheme>(
      builder: (BuildContext context, ApplicationTheme currentTheme, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget._standUp.name),
            actions: [
              PopupMenuButton<String>(
                onSelected: (selectedAction) {
                  currentTheme.switchTheme();
                },
                itemBuilder: (context) {
                  return {'Change Theme'}.map((choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            ],
          ),
          body: Column(children: [
            Wrap(
              direction: Axis.horizontal,
              children: [
                UpDownItemCard(
                  title: 'Start Time',
                  value: this.widget._standUp.startTime.format(context),
                  onPlusPressed: () {
                    setState(() {
                      TimeOfDay time = this.widget._standUp.startTime;
                      this.widget._standUp.startTime = time.addMinutes(5);
                    });
                  },
                  onMinusPressed: () {
                    setState(() {
                      TimeOfDay time = this.widget._standUp.startTime;
                      this.widget._standUp.startTime = time.addMinutes(-5);
                    });
                  },
                ),
                UpDownItemCard(
                  title: 'Duration',
                  value: formatDuration(this.widget._standUp.maxDurationForEachAttendee),
                  onPlusPressed: () {
                    setState(() {
                      Duration duration = this.widget._standUp.maxDurationForEachAttendee;
                      this.widget._standUp.maxDurationForEachAttendee =
                          duration + Duration(hours: 0, minutes: 0, seconds: 5);
                    });
                  },
                  onMinusPressed: (() {
                    setState(() {
                      Duration duration = this.widget._standUp.maxDurationForEachAttendee;
                      this.widget._standUp.maxDurationForEachAttendee =
                          duration - Duration(hours: 0, minutes: 0, seconds: 5);
                    });
                  }),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: widget._standUp.attendees.map((attendee) => AttendeeTile(attendee: attendee)).toList(),
              ),
            ),
          ]),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            clipBehavior: Clip.antiAlias,
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Theme.of(context).backgroundColor,
                selectedItemColor: Theme.of(context).textTheme.bodyText2.color,
                unselectedItemColor: Theme.of(context).textTheme.bodyText2.color,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    label: 'Add Member',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.delete),
                    label: 'Delete Stand Up',
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StandUpPlayerView(
                            standUp: this.widget._standUp,
                          )));
            },
            tooltip: 'Play',
            child: Icon(StandUpIcons.play),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}

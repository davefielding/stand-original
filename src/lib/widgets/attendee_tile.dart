import 'package:flutter/material.dart';
import 'package:standup_attempt1/data/attendee.dart';

class AttendeeTile extends StatefulWidget {
  final Attendee attendee;
  final bool isActiveToday;

  AttendeeTile({@required this.attendee, this.isActiveToday = true});

  @override
  _AttendeeTileState createState() => _AttendeeTileState(this.isActiveToday);
}

class _AttendeeTileState extends State<AttendeeTile> {
  VoidCallback _undoAction;
  bool isActiveToday;

  _AttendeeTileState(this.isActiveToday);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      tristate: false,
      value: this.isActiveToday,
      title: Text(this.widget.attendee.name),
      secondary: Icon(Icons.person, size: 32),
      onChanged: (newValue) {
        var currentState = this.widget.isActiveToday;
        this._undoAction = () => setState(() => this.isActiveToday = currentState);
        setState(() {
          this.isActiveToday = newValue ?? true;
        });

        ScaffoldState scaffold = Scaffold.of(context);
        scaffold.hideCurrentSnackBar();
        scaffold.showSnackBar(
          SnackBar(
            content: Text('${this.widget.attendee.name} is now ${this.isActiveToday ? 'available' : 'unavailable'}'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: this._undoAction,
            ),
          ),
        );
      },
    );
  }
}

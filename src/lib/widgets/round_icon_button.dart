import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({this.icon, this.onPressed});

  static const BoxConstraints _constraints = BoxConstraints.tightFor(
    width: 35,
    height: 35,
  );

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPressed,
      constraints: _constraints,
      elevation: 0,
      shape: CircleBorder(),
      fillColor: Theme.of(context).accentColor,
      child: Icon(this.icon, color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}

import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Widget child;

  ItemCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: child,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).backgroundColor.withOpacity(0.5),
      ),
    );
  }
}

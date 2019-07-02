import 'package:flutter/material.dart';
import 'constants.dart';

class ReuseCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function gdTap;
  ReuseCard({this.colour = mainCardColor, this.cardChild, this.gdTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gdTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

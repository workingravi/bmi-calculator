import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String title;

  BottomButton({this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kLargeLabelStyle,
          ),
        ),
        color: btmCntnrClr,
        width: double.infinity,
        height: btmCntnrHt,
      ),
    );
  }
}

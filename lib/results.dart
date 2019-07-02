import 'package:flutter/material.dart';
import 'constants.dart';
import 'reuse_card.dart';
import 'input.dart';
import 'bottom_button.dart';

class Results extends StatelessWidget {
  String mainResult;
  String resNumeric;
  String resExpl1;
  String resExpl2;

  Results({this.mainResult, this.resNumeric, this.resExpl1, this.resExpl2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kLargeLabelStyle,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ReuseCard(
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Center(
                        child: Text(
                      mainResult,
                      style: kLabelStyle,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0, 20.0),
                    child: Center(
                      child: Text(
                        resNumeric.toString(),
                        style: kLargeNumStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        resExpl1,
                        style: kLabelStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          resExpl2,
                          style: kLabelStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          BottomButton(
            title: 'RE-CALCULATE',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
          ),
        ],
      ),
    );
  }
}

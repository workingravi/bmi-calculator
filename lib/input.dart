import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuse_card.dart';
import 'round_icon.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';
import 'results.dart';
import 'constants.dart';

enum Gtype {
  Female,
  Male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femCardColor = inactiveCardColor;

  Gtype gender;
  double height = 180.0;
  int weight = 60;
  int age = 30;

  int ft = 5;
  int inch = 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseCard(
                    gdTap: () {
                      setState(() {
                        gender = Gtype.Male;
                      });
                    },
                    colour: gender == Gtype.Male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                    child: ReuseCard(
                  gdTap: () {
                    setState(() {
                      gender = Gtype.Female;
                    });
                  },
                  colour: gender == Gtype.Female
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReuseCard(
                cardChild: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'HEIGHT',
                        style: kLabelStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          ft.toString(),
                          style: kNumStyle,
                        ),
                        Text(
                          'ft',
                          style: kLabelStyle,
                        ),
                        Text(
                          inch.toString(),
                          style: kNumStyle,
                        ),
                        Text(
                          'inch',
                          style: kLabelStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color(0xff995555),
                          thumbColor: Color(0xff995555),
                          inactiveTrackColor: Colors.grey,
                          overlayColor: Color(0xffaa5555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height,
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newHt) {
                          setState(() {
                            height = newHt;
                            ft = newHt ~/ 30.48;
                            inch = (newHt - (ft * 30.48)) ~/ 2.54;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              flex: 4),
          Expanded(
              flex: 4,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseCard(
                      cardChild: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'WEIGHT',
                              style: kLabelStyle,
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: kNumStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIcon(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 20.0),
                              RoundIcon(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseCard(
                      cardChild: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'AGE',
                              style: kLabelStyle,
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: kNumStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIcon(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 20.0),
                              RoundIcon(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          BottomButton(
            title: 'CALCULATE',
            onTap: () {
              CalculatorBrain cb = CalculatorBrain(weight, height.toInt());

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results(
                            mainResult: cb.getResult(),
                            resNumeric: cb.calcBMI(),
                            resExpl1: cb.getExpl1(),
                            resExpl2: cb.getExpl2(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}

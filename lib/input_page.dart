import 'package:bmi_calculator/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Gender.dart';
import 'reusable_content.dart';
import 'constants.dart';
import 'bmi_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

int height = 150;
int weight = 85;
int age = 31;
double bmi;
kGenderType selectedGender;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('BMI Calculator'),
          ),
          body: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReuseableCont(
                        DoSomething: () {
                          setState(() {
                            selectedGender = kGenderType.male;
                          });
                        },
                        colour: selectedGender == kGenderType.male
                            ? kActiveColor
                            : kInactiveColor,
                        son: Gender(
                          icona: FontAwesomeIcons.mars,
                          text: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReuseableCont(
                        DoSomething: () {
                          setState(() {
                            selectedGender = kGenderType.female;
                          });
                        },
                        colour: selectedGender == kGenderType.female
                            ? kActiveColor
                            : kInactiveColor,
                        son: Gender(
                          icona: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                      child: ReuseableCont(
                    colour: kAlwan,
                    son: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: kZeena,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('$height', style: kBold),
                            Text(
                              'cm',
                              style: kZeena,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 90.0,
                              max: 220.0,
                              onChanged: (double slideIt) {
                                setState(() {
                                  height = slideIt.round();
                                });
                              }),
                        )
                      ],
                    ),
                  )),
                ]),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ReuseableCont(
                      colour: kAlwan,
                      son: Column(
                        children: [
                          Text(
                            'Weight',
                            style: kZeena,
                          ),
                          Text(
                            weight.toString(),
                            style: kBold,
                          ), //floatingaction buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyButton(
                                icon: Icons.remove,
                                pressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              MyButton(
                                icon: Icons.add,
                                pressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                      child: ReuseableCont(
                        colour: kAlwan,
                        son: Column(
                          children: [
                            Text(
                              'Age',
                              style: kZeena,
                            ),
                            Text(
                              age.toString(),
                              style: kBold,
                            ), //floatingaction buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyButton(
                                  icon: Icons.remove,
                                  pressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0),
                                MyButton(
                                  pressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: Icons.add,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                myTap: () {
                  BmiBrain calc = BmiBrain(height: height, weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmi: calc.getBmi(),
                        result: calc.getConc(),
                        advice: calc.getAdvice(),
                      ),
                    ),
                  );
                },
                myText: 'CALCULATE',
              )
            ],
          ),
        );
      },
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.myTap, @required this.myText});
  final Function myTap;
  final String myText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myTap,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        color: Colors.red,
        height: 50.0,
        width: double.infinity,
        child: Center(
          child: Text(
            myText,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({this.icon, this.pressed});
  final IconData icon;
  Function pressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 20.0,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      onPressed: pressed,
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}

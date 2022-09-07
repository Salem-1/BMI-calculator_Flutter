import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'reusable_content.dart';
import 'constants.dart';
import 'bmi_brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmi, this.result, this.advice});
  final String bmi;
  final String result;
  final String advice;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'BMI CALCULATOR',
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Your BMI is ',
                style: kTitleText,
              ),
              Expanded(
                flex: 5,
                child: ReuseableCont(
                  colour: kActiveColor,
                  son: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(result, style: kConclusion),
                      SizedBox(height: 30),
                      Text(bmi, style: kBmi),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(advice, style: kAdvice),
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                  myTap: () {
                    Navigator.pop(context);
                  },
                  myText: 'Re-Calculate')
            ],
          ),
        );
      },
    );
  }
}

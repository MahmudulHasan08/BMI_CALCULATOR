import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reuseable_card.dart';
import '../components/bootombutton.dart';
import 'package:bmicalculator/calculatorbrain.dart';

class ResultPage extends StatelessWidget {
  final String healthConditoin;
  final String bmiResult;
  final String healthAdvise;

  ResultPage(
      {required this.healthConditoin,
      required this.bmiResult,
      required this.healthAdvise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: KsimpleResultName,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: KActiveCardColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      healthConditoin,
                      style: kresultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: Kresultbmi,
                    ),
                    Text(
                      healthAdvise,
                      textAlign: TextAlign.center,
                      style: Kresultpage,
                    ),
                  ],
                ),
              )),
          BottomButton(
            ontap: () {
              Navigator.pop(context);
            },
            bottomText: 'Re CALCULATE',
          )
        ],
      ),
    );
  }
}

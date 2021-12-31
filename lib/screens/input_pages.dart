import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reuseable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'package:bmicalculator/screens/result_page.dart';
import '../components/bootombutton.dart';
import 'package:bmicalculator/components/roundiconbutton.dart';
import 'package:bmicalculator/calculatorbrain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectGender;
  int height = 180;
  int weightNumber = 60;
  int ageNumber = 25;

  // Color femalecardColor = inactivecolor;
  // Color malecardColor = inactivecolor;
  // void upadateColor(Gender selectGender){
  //   if(selectGender == Gender.male){
  //     if(malecardColor==inactivecolor){
  //       malecardColor=activeCardColor;
  //       femalecardColor=inactivecolor;
  //
  //     }
  //     else{
  //       malecardColor=inactivecolor;
  //     }
  //   }
  //   if(selectGender == Gender.female){
  //     if(femalecardColor==inactivecolor){
  //       femalecardColor=activeCardColor;
  //       malecardColor=inactivecolor;
  //
  //     }
  //     else{
  //       femalecardColor=inactivecolor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      print("male");
                      selectGender = Gender.male;
                    });
                  },
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                  colour: selectGender == Gender.male
                      ? KActiveCardColor
                      : Kinactivecolor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      print("Female Gender");
                      selectGender = Gender.female;
                    });
                  },
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'Female',
                  ),
                  colour: selectGender == Gender.female
                      ? KActiveCardColor
                      : Kinactivecolor,
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HIEGHT',
                      style: KlabelTextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: KSliderNumber,
                        ),
                        Text(
                          'cm',
                          style: KlabelTextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        // inactiveTickMarkColor: Colors.purple,
                        // activeTickMarkColor: Colors.white,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        thumbColor: Colors.white,
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x50FFFFFF),
                      ),
                      child: Slider.adaptive(
                          value: height.toDouble(),
                          min: 120,
                          max: 240,
                          divisions: 60,
                          // when put auto focus false then onther widget dont get access slider widget
                          // autofocus: false,
                          label: "$height",
                          activeColor: Colors.white,
                          inactiveColor: Color(0x50FFFFFF),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
                colour: KActiveCardColor),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                    cardChild: Column(
                      children: [
                        Text(
                          'WEIGHT',
                          style: KlabelTextstyle,
                        ),
                        Text(
                          weightNumber.toString(),
                          style: KSliderNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weightNumber--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weightNumber++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: KActiveCardColor),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: KlabelTextstyle,
                      ),
                      Text(
                        ageNumber.toString(),
                        style: KSliderNumber,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                ageNumber--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                ageNumber++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      )
                    ],
                  ),
                  colour: KActiveCardColor,
                ),
              ),
            ],
          )),
          BottomButton(
            ontap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: height, weight: weightNumber);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      bmiResult: cal.calculateBMI(),
                      healthConditoin: cal.getResult(),
                      healthAdvise: cal.getInterpretation(),
                    );
                  },
                ),
              );

              // Navigator.pushNamed(context, '/first');
            },
            bottomText: 'BMI CALCULATE',
          ),
        ],
      ),
    );
  }
}

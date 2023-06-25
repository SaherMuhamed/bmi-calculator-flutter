import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_widget.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Enums must be declared outside any classes.
// The action of establishing the number of something.
// Declaration: enum EnumName {typeA, typeB, typeC}
// Calling: EnumName.typeA
enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  // This State<InputPage> class is mutable,
  // which is properties mustn't be final or const and can be able to change and mutate.
  // it could be a normal variable that could be changed.
  GenderType? genderType;
  int height = 180;
  int weight = 70;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        centerTitle: true,
        elevation: 15.0,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // updateColor(genderType: GenderType.male);
                        genderType = GenderType.male;
                      });
                    },
                    child: reusableCard(
                      colour: genderType == GenderType.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: buildColumn(
                        genderIcon: FontAwesomeIcons.mars,
                        genderText: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // updateColor(genderType: GenderType.female);
                        genderType = GenderType.female;
                      });
                    },
                    child: reusableCard(
                      colour: genderType == GenderType.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: buildColumn(
                        genderIcon: FontAwesomeIcons.venus,
                        genderText: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: reusableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Height',
                  style: kReusableTextStyle,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumbersTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: kReusableTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: kBottomContainerColor,
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    overlayColor: const Color(0x29EB1555),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    min: 120.0,
                    max: 220.0,
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight (kg)',
                          style: kReusableTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumbersTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                                iconData: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(width: 10.0,),
                            roundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                child: reusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Age',
                        style: kReusableTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumbersTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundIconButton(
                            onPressed: () {
                              setState(() {
                                age -= 1;
                              });
                            },
                            iconData: FontAwesomeIcons.minus,
                          ),
                          const SizedBox(width: 10.0,),
                          roundIconButton(
                            onPressed: () {
                              setState(() {
                                age += 1;
                              });
                            },
                            iconData: FontAwesomeIcons.plus,),
                        ],
                      ),
                    ],
                  ),
                ),),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: kBottomContainerColor,
              width: double.infinity,
              height: kBottomContainerHeight,
              margin: const EdgeInsets.only(top: 10.0),
              child: const Center(
                child: Text(
                  'Calculate Your BMI',
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

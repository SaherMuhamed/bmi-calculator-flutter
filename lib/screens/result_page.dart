import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_widget.dart';


class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: reusableCard(
             colour: kActiveCardColor,
             cardChild: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text(
                   resultText,
                   style: resultText == 'Normal' ? kResultTextStyle : kResult2TextStyle,
                 ),
                 Text(
                   bmiResult,
                   style: kBMITextStyle,
                 ),
                 Column(
                   children: const [
                     Text(
                       'Normal BMI range:',
                       style: kIndicatorTextStyle,
                     ),
                     SizedBox(height: 7.0,),
                     Text(
                       '18.5 - 25 kg/m2',
                       style: kBodyTextStyle,
                     )
                   ],
                 ),
                 Container(
                   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                   child: Text(
                     interpretation,
                     textAlign: TextAlign.center,
                     style: kBodyTextStyle,
                   ),
                 ),
               ],
             ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: kBottomContainerColor,
                width: double.infinity,
                height: kBottomContainerHeight,
                margin: const EdgeInsets.only(top: 10.0),
                child: const Center(
                  child: Text(
                    'Re-Calculate',
                    style: kLargeButtonTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

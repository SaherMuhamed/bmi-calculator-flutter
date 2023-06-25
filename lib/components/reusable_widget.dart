import 'package:flutter/material.dart';
import '../constants.dart';


Column buildColumn({required IconData genderIcon, required String genderText}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(genderIcon, size: 80.0),
      const SizedBox(height: 15.0),
      Text(
        genderText,
        style: kReusableTextStyle,
      ),
    ],
  );
}

Container reusableCard({required Color colour, required Widget cardChild}) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        // color: const Color(0xFF1E1D33),
        color: colour,
      ),
      width: double.infinity,
      child: cardChild,
    );
  }

RawMaterialButton roundIconButton({required IconData iconData, required void Function() onPressed}){
  return RawMaterialButton(
    onPressed: onPressed,
    elevation: 5.0,
    constraints: const BoxConstraints.tightFor(
      height: 56.0,
      width: 56.0,
    ),
    shape: const CircleBorder(),
    fillColor: const Color(0xFF4C4F5E),
    child: Icon(
      iconData,
    ),
  );
}

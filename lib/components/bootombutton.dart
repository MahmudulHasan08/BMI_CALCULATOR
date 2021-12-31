import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.ontap, required this.bottomText});
  final void Function()? ontap;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
            child: Text(
          bottomText,
          style: KlabelTextstyle,
        )),
        color: KbottomColor,
        height: Kbottomheight,
        width: double.infinity,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({this.icon, this.onPressed});

  final IconData? icon;
  // final Function? onPressed;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      // disabledElevation: 6.0,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      shape: CircleBorder(),
      fillColor: Color(0x50FFFFFF),
      onPressed: onPressed,
    );
  }
}

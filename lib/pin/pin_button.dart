import 'package:flutter/material.dart';

Widget numberView({
  required Function(String) onPress,
  String? numberText,
  Color? backgroundColor,
  Color? borderColor,
  Color? textColor,
}) {
  _onPressed() {
    onPress(numberText ?? '');
  }

  return Container(
      // color: backgroundColor ?? Colors.white,
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: borderColor ?? Colors.black12,
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ]),
      child: TextButton(
        onPressed: _onPressed,
        child: Text(
          numberText ?? '',
          style: TextStyle(
              color: textColor,
              fontFamily: 'Diodrum',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ));
}

Widget iconView({
  required VoidCallback onPress,
  Widget? icon,
  Color? backgroundColor,
  Color? borderColor,
}) {
  return Container(
      // color: backgroundColor ?? Colors.white,
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: borderColor ?? Colors.black12,
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ]),
      child: TextButton(
        onPressed: onPress,
        child: icon ?? Container(),
      ));
}

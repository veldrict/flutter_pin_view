import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';

class NumberView extends StatelessWidget {
  final Function(String) onPress;
  final String? numberText;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double radius;
  final EdgeInsets? margin;
  final double fontSize;
  final FontWeight fontWeight;

  const NumberView({
    Key? key,
    required this.onPress,
    this.numberText,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.radius = 0,
    this.margin,
    this.fontSize = 24,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                color: borderColor ?? Colors.black12,
                blurRadius: 1,
                spreadRadius: 0,
              ),
            ]),
        child: TextButton(
          onPressed: () => onPress(numberText ?? ''),
          child: AutoSizeText(
            numberText ?? '',
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ));
  }
}

class IconView extends StatelessWidget {
  final VoidCallback onPress;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? borderColor;
  final double radius;
  final EdgeInsets? margin;
  const IconView(
      {Key? key,
      required this.onPress,
      this.icon,
      this.backgroundColor,
      this.borderColor,
      this.radius = 0,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: backgroundColor ?? Colors.white,
        margin: margin,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                color: borderColor ?? Colors.black12,
                blurRadius: 1,
                spreadRadius: 0,
              ),
            ]),
        child: TextButton(
          onPressed: onPress,
          child: icon ?? Container(),
        ));
  }
}

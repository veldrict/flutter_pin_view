import 'package:flutter/material.dart';

class TopPinView extends StatelessWidget {
  final int pinLength;
  final int currentLength;
  final Color? borderColor;
  final Color? highligthColor;
  final bool showUnderDots;
  final String textUnderDots;
  final VoidCallback? onPressTextUnderDots;
  final Color? backgroundColor;
  final String imgLogo;
  final double W = 15.0;
  final double H = 15.0;
  final bool showLogo;
  final String hintText;
  final String backgroundImage;
  final Color? hintTextColor;
  final Color? underDotsTextColor;
  TopPinView(
      {this.pinLength = 6,
      this.currentLength = 0,
      this.borderColor,
      this.highligthColor,
      this.showUnderDots = false,
      this.textUnderDots = '',
      this.onPressTextUnderDots,
      this.backgroundColor,
      this.imgLogo = '',
      this.showLogo = false,
      this.hintText = '',
      this.backgroundImage = '',
      this.hintTextColor,
      this.underDotsTextColor})
      : assert(currentLength >= 0),
        assert(currentLength <= pinLength);

  @override
  Widget build(BuildContext context) {
    var circles = <Widget>[];
    var color = borderColor;

    for (int i = 1; i <= pinLength; i++) {
      if (i > currentLength) {
        circles.add(
          new SizedBox(
            width: W,
            height: H,
            child: Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border:
                    new Border.all(color: color ?? Colors.black, width: 2.0),
              ),
            ),
          ),
        );
      } else {
        circles.add(
          new SizedBox(
            width: W,
            height: H,
            child: new Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border:
                    new Border.all(color: color ?? Colors.black, width: 1.0),
                color: highligthColor,
              ),
            ),
          ),
        );
      }
    }
    return backgroundImage == ''
        ? Container(
            color: backgroundColor ?? Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _logo(showLogo, imgLogo),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                ),
                Text(hintText,
                    style: TextStyle(color: hintTextColor ?? Colors.black)),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                ),
                _dot(pinLength, circles, context),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                ),
                _underDotButton(showUnderDots, textUnderDots,
                    underDotsTextColor, onPressTextUnderDots),
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _logo(showLogo, imgLogo),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                ),
                Text(hintText,
                    style: TextStyle(color: hintTextColor ?? Colors.black)),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                ),
                _dot(pinLength, circles, context),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                ),
                _underDotButton(showUnderDots, textUnderDots,
                    underDotsTextColor, onPressTextUnderDots),
              ],
            ),
          );
  }
}

// Widget _backgroundImage(String backgroundImage)

Widget _logo(bool showLogo, String imgLogo) {
  if (showLogo) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imgLogo),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
  return Container();
}

Widget _dot(int pinLength, List<Widget> circles, BuildContext context) {
  final double H = 15.0;
  return SizedBox.fromSize(
    size: new Size(MediaQuery.of(context).size.width, 30.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox.fromSize(
          size: new Size(40.0 * pinLength, H),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: circles,
          ),
        ),
      ],
    ),
  );
}

Widget _underDotButton(bool showUnderDots, String textUnderDots,
    Color? textColor, VoidCallback? onPressTextUnderDots) {
  if (showUnderDots) {
    return Container(
      child: TextButton(
        child: Text(
          textUnderDots,
          style: TextStyle(color: textColor ?? Colors.black),
        ),
        onPressed: onPressTextUnderDots,
      ),
    );
  }
  return Container();
}

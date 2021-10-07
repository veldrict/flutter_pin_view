import 'package:flutter/material.dart';
import './pin_button.dart';
import './top_pin_view.dart';

enum PinViewEnum {
  onLeft,
  onRight,
}

class PinView extends StatefulWidget {
  final Color? _pinBackgroundColor;
  final Color? _pinTextColor;
  final Color? _dotsColor;
  final Color? _highlightColor;
  final Color? _topViewBackgroundColor;
  final Color? _hintTextColor;
  final Color? _forgotPinTextColor;
  final Color? _borderPinColor;
  final String _imgLogo;
  final String _topImageBackground;
  final String? _textForgotPin;
  final String? _hintText;
  final int _pinLength;
  final Widget? _leftIcon;
  final Widget? _rightIcon;
  final VoidCallback? _leftOnPress;
  final VoidCallback? _rightOnPress;
  final String? _onDelete;
  final String? _onDeleteAll;
  final Function(String) _onMaxLength;
  final double _buttonRadius;

  // PinView({pinBackgroundColor, pinTextColor, dotsColor}):super();
  PinView({
    Key? key,
    Color? pinBackgroundColor,
    Color? pinTextColor,
    Color? dotsColor,
    Color? highlightColor,
    Color? topViewBackgroundColor,
    Color? hintTextColor,
    Color? forgotPinTextColor,
    Color? borderPinColor,
    String imgLogo = '',
    String? topImageBackground,
    String? textForgotPin,
    String? hintText,
    int pinLength = 6,
    Widget? leftIcon,
    Widget? rightIcon,
    VoidCallback? leftOnPress,
    VoidCallback? rightOnPress,
    String? onDelete,
    String? onDeleteAll,
    double? buttonRadius,
    required Function(String) onMaxLength,
  })  : _pinBackgroundColor = pinBackgroundColor,
        _pinTextColor = pinTextColor,
        _dotsColor = dotsColor,
        _highlightColor = highlightColor,
        _topViewBackgroundColor = topViewBackgroundColor,
        _hintTextColor = hintTextColor,
        _forgotPinTextColor = forgotPinTextColor,
        _borderPinColor = borderPinColor,
        _imgLogo = imgLogo,
        _topImageBackground = topImageBackground ?? '',
        _textForgotPin = textForgotPin ?? '',
        _hintText = hintText,
        _pinLength = pinLength,
        _leftIcon = leftIcon,
        _rightIcon = rightIcon,
        _leftOnPress = leftOnPress,
        _rightOnPress = rightOnPress,
        _onMaxLength = onMaxLength,
        _onDelete = onDelete,
        _onDeleteAll = onDeleteAll,
        _buttonRadius = buttonRadius ?? 0,
        super(key: key);

  _PinViewState createState() => _PinViewState();
}

class _PinViewState extends State<PinView> {
  var _pin = <String>[];
  int _currentLength = 0;

  @override
  void initState() {
    super.initState();
  }

  Color? get _pinBackground => widget._pinBackgroundColor;
  Color? get _pinTextColor => widget._pinTextColor;
  String get _imgLogo => widget._imgLogo;
  String get _topImageBackground => widget._topImageBackground;
  String? get _textForgotPin => widget._textForgotPin;
  String? get _hintText => widget._hintText;
  int get _pinLength => widget._pinLength;
  Color? get _dotsColor => widget._dotsColor;
  Color? get _highlightColor => widget._highlightColor;
  Color? get _topViewBackgroundColor => widget._topViewBackgroundColor;
  Widget? get _leftIcon => widget._leftIcon;
  Widget? get _rightIcon => widget._rightIcon;
  VoidCallback? _leftOnPress() {
    if (widget._onDelete == 'left') {
      _onDelete();
    } else {
      _onDeleteAll();
    }
    return widget._leftOnPress;
  }

  VoidCallback? _rightOnPress() {
    if (widget._onDelete == 'right') {
      _onDelete();
    } else {
      _onDeleteAll();
    }
    return widget._rightOnPress;
  }

  Function(String) get _onMaxLength => widget._onMaxLength;

  _onNumberPress(String number) {
    if (_pin.length < _pinLength) {
      setState(() {
        _currentLength++;
      });
      _pin.add(number);
    }
    if (_currentLength != 0 && _pin.length == _pinLength) {
      String pins = '';
      _pin.forEach((pin) => pins += pin);

      _onMaxLength(pins);

      _onDeleteAll();
    }
  }

  _onDelete() {
    if (_currentLength > 0) {
      setState(() {
        _currentLength--;
      });
      _pin.removeLast();
    }
  }

  _onDeleteAll() {
    setState(() {
      _currentLength = 0;
    });
    _pin.clear();
  }

  _onUnderDotsButton() {}

  _onBlankPress(String number) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: TopPinView(
            pinLength: _pinLength,
            borderColor: _dotsColor ?? Colors.white,
            highligthColor: _highlightColor ?? Colors.white,
            currentLength: _currentLength,
            showLogo: _imgLogo != '' ? true : false,
            imgLogo: _imgLogo,
            showUnderDots: _textForgotPin != '' ? true : false,
            textUnderDots: _textForgotPin ?? '',
            onPressTextUnderDots: _onUnderDotsButton,
            backgroundColor: _topViewBackgroundColor ?? Colors.white,
            backgroundImage: _topImageBackground,
            hintText: _hintText ?? '',
            hintTextColor: widget._hintTextColor,
            underDotsTextColor: widget._forgotPinTextColor,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: NumberView(
                        onPress: _onNumberPress,
                        numberText: '1',
                        backgroundColor: _pinBackground,
                        textColor: _pinTextColor,
                        borderColor: widget._borderPinColor,
                        radius: widget._buttonRadius,
                      ),
                    ),
                    Expanded(
                      child: NumberView(
                        onPress: _onNumberPress,
                        numberText: '2',
                        backgroundColor: _pinBackground,
                        textColor: _pinTextColor,
                        borderColor: widget._borderPinColor,
                        radius: widget._buttonRadius,
                      ),
                    ),
                    Expanded(
                      child: NumberView(
                        onPress: _onNumberPress,
                        numberText: '3',
                        backgroundColor: _pinBackground,
                        textColor: _pinTextColor,
                        borderColor: widget._borderPinColor,
                        radius: widget._buttonRadius,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: NumberView(
                        onPress: _onNumberPress,
                        numberText: '4',
                        backgroundColor: _pinBackground,
                        textColor: _pinTextColor,
                        borderColor: widget._borderPinColor,
                        radius: widget._buttonRadius,
                      ),
                    ),
                    Expanded(
                      child: NumberView(
                        onPress: _onNumberPress,
                        numberText: '5',
                        backgroundColor: _pinBackground,
                        textColor: _pinTextColor,
                        borderColor: widget._borderPinColor,
                        radius: widget._buttonRadius,
                      ),
                    ),
                    Expanded(
                      child: NumberView(
                        onPress: _onNumberPress,
                        numberText: '6',
                        backgroundColor: _pinBackground,
                        textColor: _pinTextColor,
                        borderColor: widget._borderPinColor,
                        radius: widget._buttonRadius,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: NumberView(
                        onPress: _onNumberPress,
                        numberText: '7',
                        backgroundColor: _pinBackground,
                        textColor: _pinTextColor,
                        borderColor: widget._borderPinColor,
                        radius: widget._buttonRadius,
                      ),
                    ),
                    Expanded(
                      child: NumberView(
                        onPress: _onNumberPress,
                        numberText: '8',
                        backgroundColor: _pinBackground,
                        textColor: _pinTextColor,
                        borderColor: widget._borderPinColor,
                        radius: widget._buttonRadius,
                      ),
                    ),
                    Expanded(
                      child: NumberView(
                        onPress: _onNumberPress,
                        numberText: '9',
                        backgroundColor: _pinBackground,
                        textColor: _pinTextColor,
                        borderColor: widget._borderPinColor,
                        radius: widget._buttonRadius,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: _leftIcon != null && _currentLength > 0
                          ? IconView(
                              onPress: _leftOnPress,
                              icon: _leftIcon,
                              backgroundColor: _pinBackground,
                              borderColor: widget._borderPinColor,
                            )
                          : NumberView(
                              onPress: _onBlankPress,
                              numberText: '',
                              backgroundColor: _pinBackground,
                              borderColor: widget._borderPinColor,
                            ),
                    ),
                    Expanded(
                      child: NumberView(
                        onPress: _onNumberPress,
                        numberText: '0',
                        backgroundColor: _pinBackground,
                        textColor: _pinTextColor,
                        borderColor: widget._borderPinColor,
                      ),
                    ),
                    Expanded(
                      child: _rightIcon != null && _currentLength > 0
                          ? IconView(
                              onPress: _rightOnPress,
                              icon: _rightIcon,
                              backgroundColor: _pinBackground,
                              borderColor: widget._borderPinColor,
                            )
                          : NumberView(
                              onPress: _onBlankPress,
                              numberText: '',
                              backgroundColor: _pinBackground,
                              borderColor: widget._borderPinColor,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
    // );
  }
}

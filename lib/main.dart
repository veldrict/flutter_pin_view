import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_view/pin/bloc/pin_bloc.dart';
import 'package:flutter_pin_view/pin/pin_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onMaxLength(String pin) {
    print(pin);
  }

// Constructor PinView yang bisa dipake
//
//  Color pinBackgroundColor,
//     Color pinTextColor,
//     Color dotsColor,
//     Color highlightColor,
//     Color topViewBackgroundColor,
//     Color hintTextColor,
//     Color forgotPinTextColor,
//     Color borderPinColor,
//     String imgLogo,
//     String topImageBackground,
//     String textForgotPin,
//     String hintText,
//     int pinLength,
//     Widget leftIcon,
//     Widget rightIcon,
//     VoidCallback leftOnPress,
//     VoidCallback rightOnPress,
//     String onDelete,
//     String onDeleteAll,

//

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PinBloc(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: PinView(
            topViewBackgroundColor: Colors.blueAccent,
            onMaxLength: _onMaxLength,
            pinLength: 6,
            textForgotPin: 'Lupa Pin?',
            onDelete: 'right',
            buttonRadius: 100,
            borderPinColor: Colors.white,
            pinBackgroundColor: Colors.blue,
            pinTextColor: Colors.white,
            rightIcon: Icon(
              Icons.backspace,
              color: Colors.white,
            ), //klo ondelete sebelah kiri masukan left icon klo di kanan masukan right icon
          )),
    );
  }
}

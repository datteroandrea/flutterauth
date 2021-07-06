import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  Widget child;
  Row appBarButtons;

  MainPage({Key? key, required this.appBarButtons, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color.fromRGBO(24, 220, 255, 1.0),
            Color.fromRGBO(125, 95, 255, 1.0)
          ], // repeats the gradient over the canvas
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: appBarButtons,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Center(
          child: child,
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

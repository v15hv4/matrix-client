import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bleep/views/screens/home.dart';

void main() {
  runApp(Bleep());
}

class Bleep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.black,
        ),
        home: Home());
  }
}

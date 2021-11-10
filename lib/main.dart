import 'package:flutter/material.dart';
import 'ui/screens/screens.dart';
import 'config/config.dart';

void main() => runApp(TimeCounterApp());

class TimeCounterApp extends StatelessWidget {
  const TimeCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: kPrimaryColor,
        fontFamily: 'Open Sans',
        primaryColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kPrimaryColor),
      ),
      home: Home(),
    );
  }
}

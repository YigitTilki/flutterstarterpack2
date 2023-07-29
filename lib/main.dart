import 'package:flutter/material.dart';
import 'package:flutterstarterpack2/InputWidgets/dateTimePicker.dart';
import 'package:flutterstarterpack2/InputWidgets/globalKey.dart';
import 'package:flutterstarterpack2/InputWidgets/otherFormElements.dart';
import 'package:flutterstarterpack2/InputWidgets/steepperWidget.dart';

import 'package:flutterstarterpack2/InputWidgets/textField.dart';
import 'package:flutterstarterpack2/InputWidgets/textFormField.dart';
import 'package:flutterstarterpack2/Prac/custom_font_drawer_inkwell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo, fontFamily: "Nemesis"),
        home: const CustomFont());
  }
}

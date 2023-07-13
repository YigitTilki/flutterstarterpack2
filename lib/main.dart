import 'package:flutter/material.dart';
import 'package:flutterstarterpack2/InputWidgets/globalKey.dart';

import 'package:flutterstarterpack2/InputWidgets/textField.dart';
import 'package:flutterstarterpack2/InputWidgets/textFormField.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GlobalKeyUsage());
  }
}

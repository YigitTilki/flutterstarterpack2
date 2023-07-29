import 'package:flutter/material.dart';

class GamepadPage extends StatefulWidget {
  const GamepadPage({super.key});

  @override
  State<GamepadPage> createState() => _GamepadPageState();
}

class _GamepadPageState extends State<GamepadPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: Center(
        child: Icon(
          Icons.safety_check,
          size: 64,
        ),
      ),
    );
  }
}

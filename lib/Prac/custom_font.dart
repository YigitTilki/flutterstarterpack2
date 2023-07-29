import 'package:flutter/material.dart';

class CustomFontUsage extends StatelessWidget {
  const CustomFontUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Custom Font Usage",
            style: TextStyle(
              fontFamily: "Nemesis",
              fontSize: 36,
            ),
          ),
          Text(
            "Custom Font Usage",
            style: TextStyle(
              fontFamily: "Cran",
              fontSize: 36,
            ),
          ),
        ],
      ),
    );
  }
}

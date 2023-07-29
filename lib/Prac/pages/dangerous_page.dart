import 'package:flutter/material.dart';

class DangerousPage extends StatefulWidget {
  const DangerousPage({super.key});

  @override
  State<DangerousPage> createState() => _DangerousPageState();
}

class _DangerousPageState extends State<DangerousPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      child: Center(
        child: Icon(
          Icons.dangerous,
          size: 64,
        ),
      ),
    );
  }
}

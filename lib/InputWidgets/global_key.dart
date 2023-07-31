import 'package:flutter/material.dart';

class GlobalKeyUsage extends StatelessWidget {
  GlobalKeyUsage({super.key});
  final counterWidgetKey = GlobalKey<_CounterWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Global Key Usage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Button Tap Counter"),
            CounterWidget(
              key: counterWidgetKey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterWidgetKey.currentState!._incrase();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  void _incrase() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _counter.toString(),
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}

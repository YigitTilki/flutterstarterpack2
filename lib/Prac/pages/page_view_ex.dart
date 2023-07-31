import 'package:flutter/material.dart';

class PageViewEx extends StatefulWidget {
  const PageViewEx({super.key});

  @override
  State<PageViewEx> createState() => _PageViewExState();
}

class _PageViewExState extends State<PageViewEx> {
  var myController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  bool horizontalAxis = true;
  bool pageSnapping = true;
  bool reverseQueue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            scrollDirection:
                horizontalAxis == true ? Axis.horizontal : Axis.vertical,
            reverse: reverseQueue,
            controller: myController,
            pageSnapping: pageSnapping,
            onPageChanged: (index) {
              debugPrint("Page Changed $index");
            },
            children: [
              Container(
                width: double.infinity,
                color: Colors.lightGreen,
                height: 300,
                child: Center(
                  child: Text(
                    "Page 0",
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.greenAccent,
                height: 300,
                child: Center(
                  child: Text(
                    "Page 1",
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.green,
                height: 300,
                child: Center(
                  child: Text(
                    "Page 2",
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.blueGrey,
            height: 200,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Work at Horizontal Axis"),
                    Checkbox(
                        value: horizontalAxis,
                        onChanged: (b) {
                          setState(() {
                            horizontalAxis = b!;
                          });
                        })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Page Snapping"),
                    Checkbox(
                        value: pageSnapping,
                        onChanged: (b) {
                          setState(() {
                            pageSnapping = b!;
                          });
                        })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Reverse Queue"),
                    Checkbox(
                        value: reverseQueue,
                        onChanged: (b) {
                          setState(() {
                            reverseQueue = b!;
                          });
                        })
                  ],
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

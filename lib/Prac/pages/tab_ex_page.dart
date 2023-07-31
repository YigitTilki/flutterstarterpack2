import 'package:flutter/material.dart';
import 'package:flutterstarterpack2/Prac/pages/five_g_page.dart';
import 'package:flutterstarterpack2/Prac/working_table.dart';

class TabEx extends StatefulWidget {
  const TabEx({super.key});

  @override
  State<TabEx> createState() => _TabExState();
}

class _TabExState extends State<TabEx> with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CustomFont(),
                  ),
                )),
        title: const Text("Tab Example"),
        bottom: myTabBar(),
      ),
      body: tabBarBody(),
    );
  }

  TabBarView tabBarBody() {
    return TabBarView(controller: tabController, children: [
      Container(
        color: Colors.redAccent,
        child: Center(
          child: Text(
            "Tab 1",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      Container(
        color: Colors.greenAccent,
        child: Center(
          child: Text(
            "Tab 2",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      Container(
        color: Colors.orangeAccent,
        child: Center(
          child: Text(
            "Tab 3",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    ]);
  }

  TabBar myTabBar() {
    return TabBar(controller: tabController, tabs: [
      Tab(
        icon: Icon(Icons.keyboard),
        text: "Tab 1",
      ),
      Tab(
        icon: Icon(Icons.lock),
        text: "Tab 2",
      ),
      Tab(
        icon: Icon(Icons.save),
        text: "Tab 3",
      ),
    ]);
  }
}

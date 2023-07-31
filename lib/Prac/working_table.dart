import 'package:flutter/material.dart';
import 'package:flutterstarterpack2/Prac/custom_font.dart';
import 'package:flutterstarterpack2/Prac/drawer_menu.dart';
import 'package:flutterstarterpack2/Prac/pages/dangerous_page.dart';
import 'package:flutterstarterpack2/Prac/pages/five_g_page.dart';
import 'package:flutterstarterpack2/Prac/pages/gamepad_page.dart';
import 'package:flutterstarterpack2/Prac/pages/page_view_ex.dart';
import 'package:flutterstarterpack2/Prac/pages/safety_check_page.dart';
import 'package:flutterstarterpack2/Prac/pages/tab_ex_page.dart';
import 'package:flutterstarterpack2/main.dart';

class CustomFont extends StatefulWidget {
  const CustomFont({super.key});

  @override
  State<CustomFont> createState() => _CustomFontState();
}

class _CustomFontState extends State<CustomFont> {
  int selectedMenuItem = 0;
  late List<Widget> allPages;
  late SearchPage searchPage;
  late MainPage mainPage;
  late PageViewEx pageViewEx;
  late DangerousPage dangerousPage;
  late GamepadPage gamepadPage;

  @override
  void initState() {
    super.initState();
    searchPage = SearchPage();
    mainPage = MainPage();
    pageViewEx = PageViewEx();
    dangerousPage = DangerousPage();
    gamepadPage = GamepadPage();
    allPages = [mainPage, searchPage, pageViewEx, dangerousPage, gamepadPage];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: selectedMenuItem <= allPages.length - 1
          ? allPages[selectedMenuItem]
          : allPages[0],
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Theme bottomNavBar() {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.redAccent.shade400,
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.five_g,
            ),
            label: "Five_g",
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.safety_check),
            label: "Face_3",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pageview,
            ),
            label: "Page View",
            backgroundColor: Colors.grey.shade500,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dangerous),
            label: "Dangerous",
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: "Gamepad",
            backgroundColor: Colors.tealAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tab),
            label: "Tab",
            backgroundColor: Colors.orangeAccent,
          ),
        ],
        fixedColor: Colors.black,
        currentIndex: selectedMenuItem,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            selectedMenuItem = index;
            if (index == 5) {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (context) => TabEx(),
                    ),
                  )
                  .then((bb) => selectedMenuItem = 0);
            }
          });
        },
      ),
    );
  }
}

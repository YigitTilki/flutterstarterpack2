import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("YigitTilki"),
            accountEmail: Text("yigittilkiw@gmail.com"),
            currentAccountPicture: Image.asset("assets/images/pngegg.png"),
            otherAccountsPictures: [
              Image.asset("assets/images/pngegg.png"),
              Image.asset("assets/images/pngegg.png"),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home Page"),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.golf_course),
                  title: Text("Golf Course"),
                  trailing: Icon(Icons.dvr_sharp),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.file_download),
                    title: Text("File Download"),
                    trailing: Icon(Icons.g_mobiledata),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

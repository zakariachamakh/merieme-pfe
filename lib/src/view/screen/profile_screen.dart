import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  final box = GetStorage();

  final RxBool isDarkMode = Get.isDarkMode.obs;

  Widget build(BuildContext context) {
    final String username = box.read('username');
    final String email = box.read('email');
    return ListView(
      children: [
        username != null
            ? UserAccountsDrawerHeader(
                accountName: Text(
                  "$username",
                  style: GoogleFonts.sacramento(fontSize: 48),
                ),
                accountEmail: email != null ? Text("$email") : Text(" "),
                decoration: BoxDecoration(color: Colors.brown.shade500),
              )
            : DrawerHeader(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.brown,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
        TextButton(
          child: ListTile(
            leading: Icon(Icons.add_location),
            title: Text('Addresse'),
          ),
          onPressed: () {},
        ),
        TextButton(
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Divider(
            height: 1,
            thickness: 2,
            indent: 16,
            endIndent: 24,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: CupertinoSlidingSegmentedControl(
            children: {
              0: Text("Light"),
              1: Text("Dark"),
            },
            groupValue: Get.isDarkMode ? 1 : 0,
            onValueChanged: (value) {
              Get.changeThemeMode(
                  value == 0 ? ThemeMode.light : ThemeMode.dark);
            },
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
      ],
    );
  }
}

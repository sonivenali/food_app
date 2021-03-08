import 'package:flutter/material.dart';

import 'home_screen_body.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState(); //cating the vlaue that has been pass by login screen
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 16, top: 14),
              child: Text(
                "Welcome!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24, top: 8),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      "https://images.thequint.com/thequint%2F2019-12%2F51dd24d1-cf40-4e88-a372-9ec60b343ccf%2FUntitled_design__38_.jpg?rect=0%2C0%2C1920%2C1080&auto=format%2Ccompress&fmt=webp&w=480&dpr=2.6"),
                  backgroundColor: Colors.transparent,
                ),
              )
            ]),
        body: HomeBody());
  }
}

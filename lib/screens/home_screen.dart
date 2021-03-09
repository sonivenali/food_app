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
                      "https://socialanimal.com/blog/wp-content/uploads/2020/06/steak-1807532_1920.jpg"),
                  backgroundColor: Colors.transparent,
                ),
              )
            ]),
        body: HomeBody());
  }
}

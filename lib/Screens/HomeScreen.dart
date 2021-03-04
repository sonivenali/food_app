import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String comingemail;  // cating the vlaue that has been pass by login screen
  const HomeScreen(this.comingemail); //cating the vlaue that has been pass by login screen

  @override
  _HomeScreenState createState() => _HomeScreenState(this.comingemail ); //cating the vlaue that has been pass by login screen
}

class _HomeScreenState extends State<HomeScreen> {
  String comingemail;  //cating the vlaue that has been pass by login screen
  _HomeScreenState(this.comingemail);  //cating the vlaue that has been pass by login screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height:MediaQuery.of(context).size.height*0.25 ,
            color: Colors.blue,
            child: Center(child: Text(comingemail,style: TextStyle(fontSize: 24),)),
          ),
          Container(
            height:MediaQuery.of(context).size.height*0.3 ,
            color: Colors.yellow,
          ),
          Container(
            height:MediaQuery.of(context).size.height*0.4 ,
            color: Colors.green,
          )
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodapp/models/home_data.dart';

class DetailScreen extends StatefulWidget {
  final Recommended data;

  DetailScreen(this.data);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.purple,
    );
  }
}


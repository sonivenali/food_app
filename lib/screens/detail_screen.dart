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
      body: Column(
        children: [
          buildTopSection(context),

        ],
      ),
    );
  }

  Widget buildTopSection(BuildContext context) {
    return Container(
      height: 450,
      child: Stack(
        children: [
          Image.network(
            widget.data.image,
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(0, 0, 0, 0.4),
          ),
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              widget.data.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

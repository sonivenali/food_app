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
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Text(
                  "About",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Text(widget.data.about,style: TextStyle(color: Colors.grey.shade700,fontSize: 16),textAlign: TextAlign.justify,),
          )
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
          Positioned(
            top: 372,
            left: 28,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 20, bottom: 8, right: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage: Image.network(
                              "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8aHVtYW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80")
                          .image,
                      radius: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 4),
                      child: Text(
                        widget.data.rating,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 372,
              right: 28,
              child: FloatingActionButton(
                elevation: 8,
                onPressed: () {},
                backgroundColor: Colors.red[300],
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/home_data.dart';
import 'package:foodapp/services/services.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final service = Services();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HomeData>(
        future: service.getFood(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildBody(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something went Wrong"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget buildBody(HomeData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: "Search food",
              contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(60),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(26),
          child: Text(
            "Recommended",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: 250,
          padding: EdgeInsets.only(left: 16),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 160,
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            data.recommended[index].image,
                            fit: BoxFit.cover,
                          )),
                    )
                  ],
                ),
              );
            },
            itemCount: data.recommended.length,
          ),
        )
      ],
    );
  }
}

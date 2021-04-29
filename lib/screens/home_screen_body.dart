import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/home_data.dart';
import 'package:foodapp/screens/detail_screen.dart';
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSearchBar(),
          buildRecommendedTitle(),
          buildRecommendedList(data),
          buildOtherFoodTitle(),
          buildOtherFoodList(data)
        ],
      ),
    );
  }

  Padding buildOtherFoodTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 26,
        left: 26,
        bottom: 8,
      ),
      child: Text(
        "Other Food",
        style: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding buildRecommendedTitle() {
    return Padding(
      padding: const EdgeInsets.all(26),
      child: Text(
        "Recommended",
        style: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding buildSearchBar() {
    return Padding(
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
    );
  }

  ListView buildOtherFoodList(HomeData data) {
    return ListView.builder(
      primary: false,
      //used this when your listview is inside of singlechildscrollview
      itemCount: data.otherFood.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 16, left: 26, bottom: 16),
          child: Container(
            height: 80,
            child: Stack(
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.network(
                          data.otherFood[index].image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 14, left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "x1",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              data.otherFood[index].name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 16,
                    right: 14,
                    child: Text(
                      data.otherFood[index].price,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w800),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  Container buildRecommendedList(HomeData data) {
    return Container(
      height: 250,
      padding: EdgeInsets.only(left: 16),
      child: ListView.builder(
        itemCount: data.recommended.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(data.recommended[index])),
              );
            },
            child: Container(
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
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8),
                    child: Text(
                      data.recommended[index].name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Positioned(
                      bottom: 12,
                      left: 12,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 18,
                      )),
                  Positioned(
                      bottom: 12,
                      left: 34,
                      child: Text(
                        data.recommended[index].rating,
                        style: TextStyle(color: Colors.white),
                      )),
                  Positioned(
                      bottom: 12,
                      right: 12,
                      child: Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 18,
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

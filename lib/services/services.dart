import 'dart:convert';

import 'package:foodapp/models/home_data.dart';
import 'package:http/http.dart' as http;



class Services{
  Future<List<HomeData>> getFood() async {
    final response = await http.get(
      'https://api.mocki.io/v1/fc788dfa',
    );
    final data = json.decode(response.body);
    List<HomeData> items = [];
    for (Map<String, dynamic> u in data) {
      items.add(HomeData.fromJson(u));
    }
    return items;
  }
}
import 'dart:convert';

import 'package:foodapp/models/home_data.dart';
import 'package:http/http.dart' as http;



class Services{
  Future<HomeData> getFood() async {
    final response = await http.get(
      'https://api.mocki.io/v1/56433485',
    );
    final data = json.decode(response.body);
    return HomeData.fromJson(data);
  }
}
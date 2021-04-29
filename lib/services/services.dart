import 'dart:convert';

import 'package:foodapp/models/home_data.dart';
import 'package:http/http.dart' as http;



class Services{
  Future<HomeData> getFood() async {
    final response = await http.get(
      'https://api.mocki.io/v1/716a11a7',
    );
    final data = json.decode(response.body);
    print(data);
    return HomeData.fromJson(data);
  }
}
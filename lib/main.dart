import 'package:flutter/material.dart';

import 'Screens/home_screen.dart';
import 'Screens/login_screen.dart';


void main() {
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

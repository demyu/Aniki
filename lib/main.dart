import 'package:flutter/material.dart';
import './homescreen.dart';

void main() {
  runApp(Aniki());
}

class Aniki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Aniki',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomeScreen(),
    );
  }
}
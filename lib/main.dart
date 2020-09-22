import 'package:flutter/material.dart';
import './homescreen.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import './Classes/animeClass.dart';

void main() async {
  runApp(Aniki());
}

class Aniki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Aniki',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.grey[900]),
      home: HomeScreen(),
    );
  }
}

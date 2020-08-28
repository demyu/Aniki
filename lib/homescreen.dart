import 'package:aniki_app/Widgets/airing.dart';
import 'package:flutter/material.dart';
import 'Widgets/categorySelector.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text('Aniki'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search), color: Colors.white, onPressed: () {})
        ],
      ),
      body: Column(children: <Widget>[
        categorySelector(),
        Expanded(
            child: Container(decoration: BoxDecoration(color: Colors.white
            ),
                    
                    ),
            
            )
      ]),
    );
  }
}

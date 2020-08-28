import 'package:flutter/material.dart';

class categorySelector extends StatefulWidget {
  @override
  _categorySelectorState createState() => _categorySelectorState();
}

class _categorySelectorState extends State<categorySelector> {
  int selectedIndex = 0;
  final List<String> categories = [
    'Watching',
    'Airing',
    'Next Season',
    'Trending'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30.0),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: index == selectedIndex ? Colors.white : Colors.white60,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3, 
                  ),
              ),
               )
            );
          }),
    );
  }
}

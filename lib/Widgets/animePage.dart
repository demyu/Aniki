import 'package:flutter/material.dart';

class AnimePage extends StatefulWidget {
  var anime;

  AnimePage({this.anime});

  _AnimePageState createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.anime['title']['romaji']),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 25, bottom: 0),
          child: 
            Image.network(widget.anime['bannerImage'].toString())
            ),
        ),
      );
  }
}

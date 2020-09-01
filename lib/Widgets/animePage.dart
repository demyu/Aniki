import 'dart:ui';
import 'package:aniki_app/Widgets/bannerImage.dart';
import 'package:aniki_app/Widgets/title.dart';
import 'package:flutter/material.dart';
import 'Cast.dart';
import 'bannerImage.dart';

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
      backgroundColor: Colors.grey,
      body: Stack(children: [
        SingleChildScrollView(
            child: Container(
                child: Column(
          children: [
            BannerImage(anime: widget.anime),
            TitleImg(anime: widget.anime),

            SizedBox(height: 100),
            Container(

                child: Cast(
                  anime: widget.anime,
                ),
                height: 300,
                color: Colors.white)
          ],
        ))),
      ]),
    );
  }
}

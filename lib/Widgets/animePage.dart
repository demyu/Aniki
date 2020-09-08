import 'dart:ui';
import 'package:aniki_app/Widgets/bannerImage.dart';
import 'package:aniki_app/Widgets/title.dart';
import 'package:flutter/material.dart';
import 'Cast.dart';
import 'bannerImage.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            BannerImage(anime: widget.anime),
            TitleImg(anime: widget.anime),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Center(
                  child: Text("Recommendations"),
                ),
                ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.anime['recommendations']['edges'][0]['node']['mediaRecommendation']['coverImage']['large']),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  Container(
                    width: 150.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.anime['recommendations']['edges'][1]['node']['mediaRecommendation']['coverImage']['large']),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  Container(
                    width: 150.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.anime['recommendations']['edges'][2]['node']['mediaRecommendation']['coverImage']['large']),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  Container(
                    width: 150.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.anime['recommendations']['edges'][3]['node']['mediaRecommendation']['coverImage']['large']),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  Container(
                    width: 150.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.anime['recommendations']['edges'][4]['node']['mediaRecommendation']['coverImage']['large']),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}

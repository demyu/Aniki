import 'dart:ui';
import 'package:aniki_app/Widgets/RecommendedAnime.dart';
import 'package:aniki_app/Widgets/bannerImage.dart';
import 'package:aniki_app/Widgets/title.dart';
import 'package:flutter/material.dart';
import 'Cast.dart';
import 'bannerImage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    final poster = widget.anime['recommendations']['edges']
                            [index]['node']['mediaRecommendation']['coverImage']
                        ['large'];
                    final id = widget.anime['recommendations']['edges'][index]
                        ['node']['mediaRecommendation']['id'];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RecommendedAnime(
                                      id: id,
                                    )));
                      },
                      child: Container(
                        width: 150.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(poster),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ]),
        ));
  }
}

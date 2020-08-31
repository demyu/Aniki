import 'dart:ui';
import 'package:aniki_app/Widgets/bannerImage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cast extends StatefulWidget{

  var anime;

  Cast({this.anime});

  _CastState createState() => _CastState();
}


class _CastState extends State<Cast>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
              child: ListView.builder(
              itemCount: widget.anime['characters']['edges'].length,
              itemBuilder: (BuildContext context, int index) {
                final character =
                    widget.anime['characters']['edges'][index]['node'];
                final voiceActor = widget.anime['characters']['edges'][index]
                    ['voiceActors'][0];

                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.network(character['image']['medium']),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(character['name']['full'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        )
                      ],
                    ));
              },
            )
            );
  }
}
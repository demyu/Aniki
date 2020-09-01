import 'dart:ui';
import 'package:aniki_app/Widgets/bannerImage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cast extends StatefulWidget {
  var anime;

  Cast({this.anime});

  _CastState createState() => _CastState();
}

class _CastState extends State<Cast> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.anime['characters']['edges'].length,
      itemBuilder: (BuildContext context, int index) {
        final character = widget.anime['characters']['edges'][index]['node'];
        final voiceActor =
            widget.anime['characters']['edges'][index]['voiceActors'][0];

        return Container(
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
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image:
                                    NetworkImage(character['image']['medium']),
                                fit: BoxFit.cover))),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(character['name']['full'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(voiceActor['name']['full'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        voiceActor['image']['medium']),
                                    fit: BoxFit.cover))),
                      ])
                    ]),
              ],
            ));
      },
    );
  }
}

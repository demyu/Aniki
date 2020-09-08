import 'dart:ui';
import 'package:aniki_app/Widgets/Cast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleImg extends StatefulWidget {
  var anime;

  TitleImg({this.anime});

  _TitleState createState() => _TitleState();
}

class _TitleState extends State<TitleImg> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height+50,
            child: Column(
              children: [
                Image.network(widget.anime['coverImage']['large']),
                SizedBox(
                  height:30
                ),
                Expanded(
                    child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: widget.anime['title']['romaji'] + "\n" + "\n",
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.normal,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: "Status: " + widget.anime['status'] + "\n",
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.normal,
                          fontSize: 25,
                          color: Colors.red),
                    ),
                    TextSpan(
                      text: "\t" + widget.anime['description'],
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ]),
                ))
              ],
            )),
            SizedBox(
              height:20
            ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => Cast(anime: widget.anime,)));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),),
              child: Center(child: Text("Cast")),
            ))
      ],
    );
  }
}

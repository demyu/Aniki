import 'dart:ui';
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
    return Wrap(children: [
      Container(
        color: Colors.red[350],
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.pink[300],
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 70,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.anime['coverImage']['large']),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 15,
            ),
            
            Container(
              width: MediaQuery.of(context).size.width -100,
                child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: widget.anime['title']['romaji'] + "\n" + "\n",
                  style: GoogleFonts.roboto(
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Colors.black),
                ),
                TextSpan(
                  text: "Status: ",
                  style: GoogleFonts.roboto(
                      fontStyle: FontStyle.normal,
                      fontSize: 17,
                      color: Colors.black),
                ),
                TextSpan(
                  text: "Status: " + widget.anime['status'] + "\n",
                  style: GoogleFonts.roboto(
                    fontStyle: FontStyle.normal,
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                  text: "\t" + widget.anime['description'],
                  style: GoogleFonts.roboto(
                      fontStyle: FontStyle.normal,
                      fontSize: 8,
                      color: Colors.black),
                ),
              ]),
            ))
          ],
        ),
      )
    ]);
  }
}

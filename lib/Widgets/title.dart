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
    return Expanded(
      child: Container(
      color: Colors.red[350],
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30.0),
      decoration: BoxDecoration(
                  color: Colors.pink[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  ),
      child: Row(
        children: <Widget>[
          SizedBox(
            child: Image.network(widget.anime['coverImage']['large']),
          ),
          SizedBox(
            width: 50,
          ),
          Expanded(
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
                    fontSize: 15,
                    color: Colors.black),
              ),
            ]),
          ))
        ],
      ),
    ));
  }
}

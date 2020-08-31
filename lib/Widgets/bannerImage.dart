import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerImage extends StatefulWidget{

  var anime;

  BannerImage({this.anime});

  _BannerImageState createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SingleChildScrollView(
                  child: Container(
                      child: Image.network(
                          widget.anime['bannerImage'].toString())),
                ),
    );
  }
}
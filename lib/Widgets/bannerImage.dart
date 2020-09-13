import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
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
    try{
    return Container(
      child: SingleChildScrollView(
                  child: Container(
                      child: CachedNetworkImage(
                  imageUrl: widget.anime['bannerImage'],
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
                ),
    );
    }catch(Exception){
      return Container();
    }
  }
}
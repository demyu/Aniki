import 'dart:ui';
import 'package:aniki_app/Classes/DBhelper.dart';
import 'package:aniki_app/Classes/Va.dart';
import 'package:aniki_app/Classes/animeClass.dart';
import 'package:aniki_app/Classes/characters.dart';
import 'package:aniki_app/Widgets/offlinecast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OfflineTitleImage extends StatefulWidget {
  int id;

  OfflineTitleImage({this.id});

  OfflineTitleImageState createState() => OfflineTitleImageState();
}

class OfflineTitleImageState extends State<OfflineTitleImage> {

  final DBHelper db = DBHelper();
  List<AnimeClass> animeclass;
  AnimeClass theAnime;

  void load() async{
    animeclass = await db.getAnimeList();
    for(int x=0; x<animeclass.length; x++){
      if(animeclass[x].getAnimeId() == widget.id){
        theAnime = animeclass[x];
      }
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    
    if(animeclass == null){
      load();
      return CircularProgressIndicator();
    }
    else
    return Column(
      children: [
        Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height + 120,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CachedNetworkImage(
                  imageUrl: theAnime.getLargeImg(),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(height: 30),
                Expanded(
                    child: Padding(padding: EdgeInsets.all(10),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: theAnime.getTitleRome() + "\n" + "\n",
                          style: GoogleFonts.roboto(
                              fontStyle: FontStyle.normal,
                              fontSize: 30,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: "Status: " + theAnime.getStatus() + "\n",
                          style: GoogleFonts.roboto(
                              fontStyle: FontStyle.normal,
                              fontSize: 25,
                              color: Colors.red),
                        ),
                        TextSpan(
                          text: "\t" + theAnime.getDesc(),
                          style: GoogleFonts.roboto(
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ]),
                    ),
                    
                    ),)
              ],
            )),
        SizedBox(height: 20),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => OfflineCast(
                            id: widget.id,
                          )));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Center(child: Text("Cast")),
            ))
      ],
    );
  }
}

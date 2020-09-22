import 'dart:ui';
import 'package:aniki_app/Classes/DBhelper.dart';
import 'package:aniki_app/Classes/Va.dart';
import 'package:aniki_app/Classes/animeClass.dart';
import 'package:aniki_app/Classes/characters.dart';
import 'package:aniki_app/Widgets/RecommendedAnime.dart';
import 'package:aniki_app/Widgets/bannerImage.dart';
import 'package:aniki_app/Widgets/offlineTitleImage.dart';
import 'package:aniki_app/Widgets/title.dart';
import 'package:flutter/material.dart';
import 'bannerImage.dart';
import 'package:characters/characters.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';

class OfflineAnimePage extends StatefulWidget {
  int id;

  OfflineAnimePage({this.id});

  OfflineAnimePageState createState() => OfflineAnimePageState();
}

class OfflineAnimePageState extends State<OfflineAnimePage> {
  
  DBHelper db = DBHelper();
  List<AnimeClass> animeclass;
  List<CharactersCast> characterCast;
  List<CharactersCast> backup = List();
  AnimeClass theAnime;
  
  
  void load() async{
    animeclass = List();
    animeclass = await db.getAnimeList();
    characterCast = await db.getCharacterList();
    for(int x=0; x<animeclass.length; x++){
      if(animeclass[x].getAnimeId() == widget.id){
        theAnime = animeclass[x];
      }
    }

    setState(() {
    });
  }

  bool isFavorite(int x){
    for(int i=0; i<animeclass.length; i++){
      if(animeclass[i].getAnimeId() == x){
        return true;
      }
    }
    return false;
  }

  void addAnime(){
    db.addAnime(theAnime);
  }

  void addCharacterCast(){
    for(int x = 0; x<backup.length; x++){
      CharactersCast temp = CharactersCast(backup[x].getName(), backup[x].getImage(), backup[x].getAnimeId(), backup[x].getVaid());
      db.addCharacters(temp);
    }
    load();
  }

  void deleteAnime(int x){
    db.deleteAnime(x);
    backup = characterCast;
    db.deleteCharacter(x);
    load();
  }


  @override
  Widget build(BuildContext context) {
    if(animeclass == null){
      load();
      return CircularProgressIndicator();
    }
    else
    return Scaffold(
        appBar: AppBar(
          title: Text(theAnime.getTitleRome()),
          actions: [IconButton(icon: Icon(Icons.favorite, color: isFavorite(widget.id)? Colors.red: Colors.white), onPressed: () {
            setState(() {
              if(!isFavorite(widget.id)){
                addAnime();
                addCharacterCast();
              }else{
                deleteAnime(widget.id);
              }
            });
          })],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            BannerImage(anime: theAnime.getConverImg()),
            //Make offline titleImage
            OfflineTitleImage(id: widget.id),
          ]),
        ));
  }
}

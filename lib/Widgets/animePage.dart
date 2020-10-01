import 'dart:ui';
import 'package:aniki_app/Classes/DBhelper.dart';
import 'package:aniki_app/Classes/Va.dart';
import 'package:aniki_app/Classes/animeClass.dart';
import 'package:aniki_app/Classes/characters.dart';
import 'package:aniki_app/Widgets/RecommendedAnime.dart';
import 'package:aniki_app/Widgets/bannerImage.dart';
import 'package:aniki_app/Widgets/title.dart';
import 'package:flutter/material.dart';
import 'bannerImage.dart';
import 'package:characters/characters.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';

class AnimePage extends StatefulWidget {
  var anime;

  AnimePage({this.anime});

  _AnimePageState createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  
  DBHelper db = DBHelper();
  List<AnimeClass> animeclass;
  List<CharactersCast> characters;
  List<VA> va;
  
  void load() async{
    animeclass = List();
    characters = List();
    va = List();
    animeclass = await db.getAnimeList();
    characters = await db.getCharacterList();
    va = await db.getVaList();
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

  void addAnime(String titleEnglish, String titleRomaji, String description, String coverImage, String mediumImage, String largeImage, int animeid, status){
    AnimeClass anime = AnimeClass(titleEnglish, titleRomaji, description, coverImage, mediumImage, largeImage, animeid, status);
    db.addAnime(anime);
  }

  void addCharacterCast(var x, int id){
    for(int y=0; y<x['characters']['edges'].length; y++){
      final ch = x['characters']['edges'][y]['node'];
      final va = x['characters']['edges'][y]['voiceActors'][0];
      db.addCharacters(CharactersCast(ch['name']['full'], ch['image']['medium'], id, va['id']));
    }
  }

  void addVa(var x, int id){
    List<int> nonreplist = List();
    List<VA> nonrepva = List();
    List<int> dbids = List();
    for(int y=0; y<x['characters']['edges'].length; y++){
      final vaT = x['characters']['edges'][y]['voiceActors'][0];
      final va = x['characters']['edges'][y]['voiceActors'][0]['name']['full'].toString();
      if(!nonreplist.contains(vaT['id'])){
        VA temp = VA(va, vaT['image']['medium'], vaT['id']);
        nonrepva.add(temp);
      }
    }
    for(int x = 0; x<va.length; x++){
      dbids.add(va[x].getVaId());
    }
    for(int x =0; x<nonrepva.length; x++){
      if(!dbids.contains(nonrepva[x].getVaId())){
        db.addVa(nonrepva[x]);
      }
    }

    load();
  }

  void deleteAnime(int x){
    db.deleteAnime(x);
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
          title: Text(widget.anime['title']['romaji']),
          actions: [IconButton(icon: Icon(Icons.favorite, color: isFavorite(widget.anime['id']) ? Colors.red: Colors.white), onPressed: () {
            setState(() {
              if(!isFavorite(widget.anime['id'])){
                addAnime(widget.anime['title']['english'], widget.anime['title']['romaji'], widget.anime['description'], widget.anime['bannerImage'], widget.anime['coverImage']['medium'], widget.anime['coverImage']['large'], widget.anime['id'], widget.anime['status']);
                addCharacterCast(widget.anime, widget.anime['id']);
                addVa(widget.anime, widget.anime['id']);
              }else{
                deleteAnime(widget.anime['id']);
              }
            });
          })],
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
                    try{
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
                    }catch(Exception){}
                  }),
            ),

          ]),
        ));
  }
}

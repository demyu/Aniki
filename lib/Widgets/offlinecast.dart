import 'dart:ui';
import 'package:aniki_app/Classes/DBhelper.dart';
import 'package:aniki_app/Classes/Va.dart';
import 'package:aniki_app/Classes/characters.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OfflineCast extends StatefulWidget {
  int id;

  OfflineCast({this.id});

  OfflineCastState createState() => OfflineCastState();
}

class OfflineCastState extends State<OfflineCast> {

  final DBHelper db = DBHelper();
  List<CharactersCast> characterCast;
  List<CharactersCast> loadedCast;
  List<VA> va;
  List<VA> loadedVA;

  void load() async{
    characterCast = List();
    loadedCast = List();
    va = List();
    loadedVA = List();

    characterCast = await db.getCharacterList();
    va = await db.getVaList();

    for(int x = 0; x<characterCast.length; x++){
      if(characterCast[x].getAnimeId() == widget.id){
        loadedCast.add(characterCast[x]);
      }
    }
    print(va.length);

    for(int x=0; x<loadedCast.length; x++){
      for(int y=0; y <va.length; y++){
        if(va[y].getVaId() == loadedCast[x].getVaid()){
          loadedVA.add(va[y]);
        }
      }
    }

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    if(characterCast == null){
      load();
      return CircularProgressIndicator();
    }
    else

    return Scaffold(
      appBar: AppBar(
        title: Text("Cast"),
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: loadedCast.length,
        itemBuilder: (BuildContext context, int index) {
          final character = loadedCast[index];
          final voiceActor =
              loadedVA[index];

          return Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5, right: 1, left: 1),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.pink[300],
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
                          height: 100,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      character.getImage()),
                                  fit: BoxFit.cover))),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(character.getName(),
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
                              Text(voiceActor.getName(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                              height: 100,
                              width: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          voiceActor.getImage()),
                                      fit: BoxFit.cover))),
                        ])
                      ]),
                ],
              ));
        },
      ),
    );
  }
}

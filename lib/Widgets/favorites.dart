import 'package:aniki_app/Classes/DBhelper.dart';
import 'package:aniki_app/Classes/Va.dart';
import 'package:aniki_app/Classes/animeClass.dart';
import 'package:aniki_app/Classes/characters.dart';
import 'package:aniki_app/Widgets/offlneAnimePage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class favoriteTab extends StatefulWidget {
  _favoriteTabState createState() => _favoriteTabState();
}

class _favoriteTabState extends State<favoriteTab>{

  final DBHelper db = DBHelper();
  List<AnimeClass> animeclass;
  List<CharactersCast> characterCast;
  List<VA> va;

  void load() async{
    animeclass = List();
    characterCast = List();
    va = List();
    animeclass = await db.getAnimeList();
    characterCast = await db.getCharacterList();
    va = await db.getVaList();

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    if(animeclass == null){
      load();
      return CircularProgressIndicator();
    } 
    return Container(
          child: ListView.builder(
        itemCount: animeclass.length,
        itemBuilder: (BuildContext context, int index) {
          final ani = this.animeclass[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => OfflineAnimePage(
                            id: ani.getAnimeId(),
                          )));
            },
            child: Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5, right: 10, left: 5),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.pink[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(ani.getConverImg()),
                      fit: BoxFit.cover)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: ani.getMediumImg(),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(ani.getTitleRome(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(ani.getTitleEng(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ]),
            ),
          );
        },
      ));
  }
}

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'animePage.dart';
import 'dart:convert';

class SearchAnime extends StatefulWidget {
  var quer;

  SearchAnime ({this.quer});

  _SearchAnimeState createState() => _SearchAnimeState();
}



class _SearchAnimeState extends State<SearchAnime> {
  var anime;
  

  fetchData() async {
    String query = widget.quer;
    print(query);
    var url = 'https://graphql.anilist.co';
    var response = await http.post(url, body: {'query': query});

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      setState(() {
        String test = response.body;
        int num = test.indexOf("media");
        String y = "{\"";
        y += test.substring(num, test.length - 2);
        Map<String, dynamic> map = json.decode(y);
        this.anime = map['media'];
      });
    } else {
      print("Error");
      print(response.body.toString());  
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    // TODO: implement build
    if (this.anime != null) {
      return Container(
          child: ListView.builder(
        itemCount: anime.length,
        itemBuilder: (BuildContext context, int index) {
          final ani = this.anime[index];
          return Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5, right: 10, left: 5),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.pink[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(ani['bannerImage']),
                      fit: BoxFit.cover)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.network(
                          ani['coverImage']['medium'],
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(ani['title']['romaji'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(ani['title']['english'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          color: Colors.white,
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AnimePage(anime: ani,))),
                        )
                      ],
                    )
                  ]));
        },
      ));
    } else {
      return CircularProgressIndicator();
    }
  }
}
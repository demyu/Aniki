import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'animePage.dart';
import 'dart:convert';

class Trending extends StatefulWidget {
  @override
  TrendingState createState() => TrendingState();
}

class TrendingState extends State<Trending> {
  var anime;

  DateTime now = new DateTime.now();

  CachedNetworkImageProvider getImage(String x) {
    try {
      return CachedNetworkImageProvider(x);
    } catch (Exception) {
      return CachedNetworkImageProvider(
          "https://gblobscdn.gitbook.com/assets%2F-LPYQBx3Klbiq2P146cj%2F-LPw7ybOMUCMeaDQMKzN%2F-LPw9Yj6jRcemLmFI4x8%2Fbanner-entries4.png?alt=media&token=68ac3381-a911-4576-b95e-2fbd0ddbde83");
    }
  }

  String query;

  fetchData() async {
    query = """
        query {
          Page(page: 1, perPage: 20){
    pageInfo {
      total
      currentPage
      lastPage
      hasNextPage
    }
    media(type: ANIME, sort: POPULARITY_DESC){
      id
      title {
        romaji
        english
      }
      characters{
        edges{
          node{
            name{
              full
            }
            image{
              medium
            }
          }
          voiceActors(language: JAPANESE) {
            id
            name {
              full
            }
            image{
              medium
            }  
          }
          
        }
      }
      description
      coverImage{
        large
        medium
      }
      status
      bannerImage
      recommendations {
        edges {
          node {
            mediaRecommendation {
              id
              title{
                romaji
              }
              coverImage{
                large
                medium
              }
            }

          }
        }
    }
    }
  }
        }
  """;

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
      print(response.body);
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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AnimePage(
                            anime: ani,
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
                  image: getImage(ani['bannerImage']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: ani['coverImage']['medium'],
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
                              child: Text(ani['title']['romaji'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(ani['title']['english'].toString(),
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
    } else {
      return CircularProgressIndicator();
    }
  }
}

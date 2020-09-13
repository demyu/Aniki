import 'package:aniki_app/Widgets/animePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'bannerImage.dart';
import 'title.dart';

class RecommendedAnime extends StatefulWidget {
  var id;

  RecommendedAnime({this.id});

  _RecommendedAnimeState createState() => _RecommendedAnimeState();
}

class _RecommendedAnimeState extends State<RecommendedAnime> {
  var anime;
  @override
  Widget build(BuildContext context) {
    int theID = widget.id;
    
    String query = """
        {
          Media(id: $theID, sort: POPULARITY_DESC){
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
    """;

    fetchData() async {
    var url = 'https://graphql.anilist.co';
    var response = await http.post(url, body: {'query': query});

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      setState(() {
        var test = response.body;
        
        
        Map<String, dynamic> map = json.decode(test);
        this.anime = map['data']['Media'];
      });
    } else {
      print("Error");
    }
  }

    fetchData();


    if(anime == null){
      return Center(
        child: CircularProgressIndicator()
      );
    }else{
      return AnimePage(anime: this.anime);
    }
  }
}

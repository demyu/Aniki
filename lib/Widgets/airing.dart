import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class airing extends StatefulWidget {
  @override
  _airingSelectorState createState() => _airingSelectorState();
}

class _airingSelectorState extends State<airing> {
  var anime;
  String query = """
        query {
          Page(page: 1, perPage: 1){
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
        native
        userPreferred
      }
      coverImage{
        medium
      }
    }
  }
        }
  """;

  fetchData() async {
    var url = 'https://graphql.anilist.co';
    var response = await http.post(url, body: {'query': query});
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      var resp = json.decode(response.body);
      this.anime = resp["media"];
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    // TODO: implement build
    return ListView.builder(
      itemCount: this.anime.length,
      itemBuilder: (BuildContext context, int index) {
        final ani = this.anime[index];
        return Text(ani["id"]);
      },
    );
  }
}

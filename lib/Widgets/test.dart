import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class test {
  
}

main(List<String> args) {
  fetchData();
}

int page = 1;

String query = """
        query {
          Page(page: $page, perPage: 2){
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
    var response = await http.post(url, body: {'query' : query});

    if(response.statusCode >= 200 && response.statusCode<=299){
      String test = response.body;
      int num = test.indexOf("media");
      String y = "{\"";
      y +=test.substring(num, test.length-2);
      Map<String,dynamic> map = json.decode(y);
      var anime = map['media'];
      print(anime[0]);
    }else{
      print("Error");
    }
  }
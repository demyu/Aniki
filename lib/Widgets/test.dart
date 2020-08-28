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

int page = 2;

String query = """
        query {
          Page(page: $page, perPage: 1){
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
    print(response.body);

    if(response.statusCode == 200){
      print(response.body);
      var resp = json.decode(response.body);
      var anime = resp["media"];

    }else{
      print("Error");
    }
  }
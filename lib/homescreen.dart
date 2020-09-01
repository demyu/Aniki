import 'package:aniki_app/Widgets/airing.dart';
import 'package:aniki_app/Widgets/searchAnime.dart';
import 'package:flutter/material.dart';
import 'Widgets/categorySelector.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text('Aniki'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      body: Column(children: <Widget>[
        categorySelector(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Airing(),
          ),
        )
      ]),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          var query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query != ""){
      var search = query.toString();
    var quer = """
        query {
          Page(page: 1, perPage: 5){
    pageInfo {
      total
      currentPage
      lastPage
      hasNextPage
    }
    media(search: "$query" ,type: ANIME, sort: POPULARITY_DESC){
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
    }
  }
        }
  """;
    return SearchAnime(quer: quer);
  }
    
    return Text(query); 
  
  }
}

import 'package:aniki_app/Widgets/airing.dart';
import 'package:aniki_app/Widgets/favorites.dart';
import 'package:aniki_app/Widgets/searchAnime.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;
    final List<String> categories = [
      'Watching',
      'Airing',
      'Next Season',
      'Trending'
    ];
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/LeadingIcon.png', fit: BoxFit.contain,),
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
        Container(
          height: 90.0,
          color: Theme.of(context).primaryColor,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30.0),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: index == selectedIndex
                              ? Colors.white
                              : Colors.white60,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ));
              }),
        ),
        if(selectedIndex == 0)
          Expanded(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: favoriteTab(),
          ),
        )
        else if(selectedIndex == 1)
          Expanded(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Airing(),
          ),
        )
        else if(selectedIndex ==2 )
          Text("Next Season")
        else if(selectedIndex ==3)
          Text("Trending")
      ]),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
     //Stonks
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
    if (query != "") {
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
      recommendations{
        edges{
          node{
            mediaRecommendation{
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
      return SearchAnime(quer: quer);
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("");
  }
}

import 'package:flutter/material.dart';
import 'package:aniki_app/RW_JSON/IOJSON.dart';
import 'dart:convert';


class favoriteTab extends StatefulWidget {

  final FaveStorage faveStorage = FaveStorage();

  _favoriteTabState createState() => _favoriteTabState();
}

class _favoriteTabState extends State<favoriteTab>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var map;
    String _faveString;

    _favoriteTabState(){
      widget.faveStorage.readFavorites().then((String text){
      setState(() {
        _faveString = text;
        map = json.decode(text);
      });
    });
    }
    return Container(

    );
  }
}

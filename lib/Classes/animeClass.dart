import 'package:aniki_app/Classes/characters.dart';
import 'package:flutter/cupertino.dart';
import 'characters.dart';

import 'dart:convert';


class AnimeClass{
  int id, animeId;
  String titleEnglish;
  String titleRomaji; 
  String description;
  String coverImage;
  String mediumImage;
  String largeImage;
  String status;

  AnimeClass(this.titleEnglish, this.titleRomaji, this.description, this.coverImage, this.mediumImage, this.largeImage, this.animeId, this.status);
  AnimeClass.withID(this.id,this.titleEnglish, this.titleRomaji, this.description, this.coverImage, this.mediumImage, this.largeImage, this.animeId, this.status);
  AnimeClass.fromDB(Map<String,dynamic> data){
    this.id = data['id'];
    this.titleEnglish = data['titleenglish'];
    this.titleRomaji = data['titleromaji'];
    this.description = data['description'];
    this.coverImage = data['coverimage'];
    this.mediumImage = data['mediumimage'];
    this.largeImage = data['largeimage'];
    this.animeId = data['animeid'];
    this.status = data['status'];
  }

  Map<String,dynamic> toMap(){
    Map<String, dynamic> data = {
      'titleenglish' : this.titleEnglish,
      'titleromaji' : this.titleRomaji,
      'description' : this.description,
      'coverimage' : this.coverImage,
      'mediumimage' : this.mediumImage,
      'largeimage' : this.largeImage,
      'animeid' : this.animeId,
      'status' : this.status
    };
    if (id != null) {
      data['id'] = this.id;
    }
    return data;
  }

  int getAnimeId(){
    return this.animeId;
  }

  int getId(){
    return this.id;
  }

  String getTitleEng(){
    return titleEnglish;
  }
  String getTitleRome(){
    return this.titleRomaji;
  }
  String getDesc(){
    return this.description;
  }
  String getConverImg(){
    return this.coverImage;
  }
  String getMediumImg(){
    return this.mediumImage;
  }
  String getLargeImg(){
    return this.largeImage;
  }

  String getStatus(){
    return this.status;
  }
  
}
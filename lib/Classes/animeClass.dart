


import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class animeClass {
  
  String titleEnglish, titleRomaji, description;
  File coverImage, mediumImage, largeImage;
  
  String path;

  animeClass(){}

  void setTitleEnglish(String x){
    this.titleEnglish = x;
  }
  void setTitleRomaji(String x){
    this.titleRomaji = x;
  }
  void setDescription(String x){
    this.description =  x;
  }
  void setCoverImage(String x){
    
  }

}
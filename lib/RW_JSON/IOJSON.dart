import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FaveStorage {
  Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async{
    final path = await _localPath;

    return File("$path/favorites.json");
  }

  Future<String> readFavorites() async{
    try{
      final favFile = await _localFile;

      String contents = await favFile.readAsString();
      return contents;
    }catch (e){
      return null;
    }
  }

  Future<File> writeFaveFile(String text) async{
    final favFile = await _localFile;
    return favFile.writeAsString('$text');
  }
}
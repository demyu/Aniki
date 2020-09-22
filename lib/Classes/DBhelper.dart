import 'dart:async';
import 'package:aniki_app/Classes/Va.dart';
import 'package:aniki_app/Classes/animeClass.dart';
import 'package:aniki_app/Classes/characters.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


  class DBHelper {
  static DBHelper _dbHelper;
  static Database _db;

  DBHelper._createInstance();
  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._createInstance();
    }
    return _dbHelper;
  }

  Future<Database> initializeDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'test8.db'),
      onCreate: (db, version) {
        String table1 = """CREATE TABLE va(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            vaname VARCHAR NOT NULL,
            vaimage VARCHAR NOT NULL,
            vaid INTEGER NOT NULL
          )""";
        String table2 = """CREATE TABLE characters(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            charactername VARCHAR NOT NULL,
            characterimage VARCHAR NOT NULL,
            animeid INTEGER NOT NULL,
            vaid INTEGER NOT NULL
          )""";
        String table3 = """CREATE TABLE animeclass(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titleenglish VARCHAR NOT NULL,
            titleromaji VARCHAR NOT NULL,
            description VARCHAR NOT NULL,
            coverimage VARCHAR NOT NULL,
            mediumimage VARCHAR NOT NULL,
            largeimage VARCHAR NOT NULL,
            animeid INTEGER NOT NULL,
            status VARCHAR NOT NULL
          )""";
        db.execute(table1);
        db.execute(table2);
        db.execute(table3);
      },
      version: 1,
    );
  }

  Future<Database> getDatabase() async {
    if (_db == null) {
      _db = await initializeDatabase();
    }
    return _db;
  }

  Future<List<AnimeClass>> getAnimeList() async {
    var db = await this.getDatabase();
    var list = await db.query('animeclass');
    List<AnimeClass> userList = [];
    for (var data in list) {
      userList.add(AnimeClass.fromDB(data));
    }
    return userList;
  }

  Future<List<CharactersCast>> getCharacterList() async {
    var db = await this.getDatabase();
    var list = await db.query('characters');
    List<CharactersCast> userList = [];
    for (var data in list) {
      userList.add(CharactersCast.fromDB(data));
    }
    return userList;
  }

  Future<List<VA>> getVaList() async {
    var db = await this.getDatabase();
    var list = await db.query('va');
    List<VA> userList = [];
    for (var data in list) {
      userList.add(VA.fromDB(data));
    }
    return userList;
  }

  Future<int> addAnime(AnimeClass user) async {
    var db = await this.getDatabase();
    return await db.insert('animeclass', user.toMap());
  }

  Future<int> addCharacters(CharactersCast restaurant) async {
    var db = await this.getDatabase();
    return await db.insert('characters', restaurant.toMap());
  }

  Future<int> addVa(VA user) async {
    var db = await this.getDatabase();
    return await db.insert('va', user.toMap());
  }

  Future<int> deleteAnime(int id) async {
    var db = await this.getDatabase();
    return await db.delete('animeclass', where: 'animeid = ?', whereArgs: [id]);
  }

  Future<int> deleteCharacter(int id) async {
    var db = await this.getDatabase();
    return await db.delete('characters', where: 'animeid = ?', whereArgs: [id]);
  }

}

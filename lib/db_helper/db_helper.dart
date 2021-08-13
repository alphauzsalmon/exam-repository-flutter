import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:exam_db_firebase/picture.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initialDatabase();
      return _database!;
    } else {
      return _database!;
    }
  }

  Future _initialDatabase() async {
    var lock = Lock();
    Database? _db;

    if (_db == null) {
      await lock.synchronized(() async {
        if (_db == null) {
          var databasesPath = await getDatabasesPath();
          String path = join(databasesPath!, 'exam.db');
          print("DB ning PATHi: " + path.toString());
          var file = File(path);

          if (!await file.exists()) {
            ByteData data = await rootBundle.load(join("assets", "exam.db"));
            List<int> bytes = data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
            await File(path).writeAsBytes(bytes);
          }
          _db = await openDatabase(path);
        }
      });
    }
    return _db;
  }

  void savePicture(Picture picture) async {
    var dbClient = await _getDatabase();
    await dbClient.insert("pictures", picture.toMap());
  }

  Future<List<Picture>> getPictures() async {
    var dbClient = await _getDatabase();
    List<Map> list = await dbClient.query("pictures");
    print("DB Helper: " + list.toString());
    List<Picture> pictures = [];
    for (int i = 0; i < list.length; i++) {
      pictures.add(Picture(
        id: list[i]["ID"],
        title: list[i]["Title"],
        picture: list[i]["Picture"]
      ));
    }
    return pictures;
  }
}

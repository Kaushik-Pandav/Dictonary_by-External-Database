import 'dart:io';

import 'package:dictonary/modelwordmeaning.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper extends GetxController {
  Database? database;
  RxList<Word> allword = <Word>[].obs;
  int A =0;
  @override
  void onInit() {
    print("K=====");
    createdatabase().then((value) {
      database = value;
      print("KK======$value");
      getdata(database!).then((kk) {
        print("===W$kk");
        allword.value = kk;
      });
    });
  }

  @override
  void onReady() {}

  Future<Database> createdatabase() async {
    Database db;
    Directory directory = await getApplicationDocumentsDirectory();
    String dbpath = join(directory.path, "databasenew.db");
    if (File(dbpath).existsSync()) {
      db = await openDatabase(dbpath);
      return db;
    } else {
      ByteData data = await rootBundle.load("Assets/dic.db");
      List<int> byte = data.buffer.asInt8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(dbpath).writeAsBytes(byte, flush: true);
      db = await openDatabase(dbpath);
      return db;
    }
  }

  Future<List<Word>> getdata(Database db) async {
    String sql = "SELECT word,nepali_meaning FROM DICTIONARY";
    List data = await db.rawQuery(sql);
    List<Word> mean = [];
    for (int i = 0; i < data.length; i++) {
      Word word = Word(data[i]["nepali_meaning"], data[i]["word"]);
      mean.add(word);
    }

    print("=====M$mean");
    return mean;
  }
}

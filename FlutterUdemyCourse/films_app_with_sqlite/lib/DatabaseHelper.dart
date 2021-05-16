import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  static final String databaseName = "filmler.sqlite";

  static Future<Database> accessDatabase() async{
    String url = join(await getDatabasesPath(),databaseName);
    if(await databaseExists(url)){
      print("Veri tabanı var");
    }
    else{
      ByteData data = await rootBundle.load("database/$databaseName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(url).writeAsBytes(bytes,flush: true);
      print("veri tabanı kopyalandı");
    }
    return openDatabase(url);
  }

}
import 'package:dictionary_app/DatabaseHelper.dart';

import 'Kelimeler.dart';

class KelimelerDao{

  Future<List<Kelimeler>> allWords() async{

    var db = await DatabaseHelper.accessDatabase();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler");
    
    return List.generate(maps.length, (index){
      var word = maps[index];
      return Kelimeler(word["kelime_id"], word["ingilizce"], word["turkce"]);
    });

  }

  Future<List<Kelimeler>> search(String key) async{

    var db = await DatabaseHelper.accessDatabase();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler WHERE ingilizce like '%$key%'");

    return List.generate(maps.length, (index){
      var word = maps[index];
      return Kelimeler(word["kelime_id"], word["ingilizce"], word["turkce"]);
    });

  }
}
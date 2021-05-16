import 'package:sqlite_database/DatabaseHelper.dart';

import 'Kisiler.dart';

class KisilerDao{
  Future<List<Kisiler>> getAll() async{
    var db = await DatabaseHelper.accessDatabase();
    
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler");
    
    return List.generate(maps.length, (i){

      var user = maps[i];
      return Kisiler(user["kisi_id"], user["kisi_ad"], user["kisi_yas"]);

    });
  }

  Future<List<Kisiler>> insert(String kisi_ad, int kisi_yas) async{
    var db = await DatabaseHelper.accessDatabase();

    var info = Map<String, dynamic>();
    info["kisi_ad"] = kisi_ad;
    info["kisi_yas"] = kisi_yas;

    await db.insert("kisiler", info);

  }

  Future<List<Kisiler>> delete(int kisi_id) async{
    var db = await DatabaseHelper.accessDatabase();

    await db.delete("kisiler",where: "kisi_id = ?",whereArgs: [kisi_id]);

  }

  Future<List<Kisiler>> update(int kisi_id, String kisi_ad, int kisi_yas) async{
    var db = await DatabaseHelper.accessDatabase();

    var info = Map<String, dynamic>();
    info["kisi_ad"] = kisi_ad;
    info["kisi_yas"] = kisi_yas;

    await db.update("kisiler", info,where: "kisi_id=?",whereArgs: [kisi_id]);

  }

  Future<int> control(String kisi_ad) async{
    var db = await DatabaseHelper.accessDatabase();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT count(*) AS result FROM kisiler WHERE kisi_ad='$kisi_ad'");

    return maps[0]["result"];
  }

  Future<Kisiler> get(int kisi_id) async{
    var db = await DatabaseHelper.accessDatabase();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_id = $kisi_id");

    var user = maps[0];
    return Kisiler(user["kisi_id"], user["kisi_ad"], user["kisi_yas"]);
  }

  Future<List<Kisiler>> search(String key) async{
    var db = await DatabaseHelper.accessDatabase();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler where kisi_ad like '%$key%'");

    return List.generate(maps.length, (i){

      var user = maps[i];
      return Kisiler(user["kisi_id"], user["kisi_ad"], user["kisi_yas"]);

    });
  }

  Future<List<Kisiler>> getRandomLimitedUsers() async{
    var db = await DatabaseHelper.accessDatabase();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler ORDER BY RANDOM() LIMIT 2'");

    return List.generate(maps.length, (i){

      var user = maps[i];
      return Kisiler(user["kisi_id"], user["kisi_ad"], user["kisi_yas"]);

    });
  }
}
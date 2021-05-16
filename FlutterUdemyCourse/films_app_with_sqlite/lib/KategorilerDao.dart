import 'package:films_app_with_sqlite/DatabaseHelper.dart';
import 'package:films_app_with_sqlite/Kategoriler.dart';

class KategorilerDao{
  Future<List<Kategoriler>> allCategories() async{
    var db = await DatabaseHelper.accessDatabase();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kategoriler");
    
    return List.generate(maps.length, (index){
      var category = maps[index];
      return Kategoriler(category["kategori_id"], category["kategori_ad"]);
    });
  }
}
import 'package:films_app_with_sqlite/Filmler.dart';
import 'package:films_app_with_sqlite/Yonetmenler.dart';

import 'DatabaseHelper.dart';
import 'Kategoriler.dart';

class FilmlerDao{
  Future<List<Filmler>> allFilmsBtCategoryId(int category_id) async{
    var db = await DatabaseHelper.accessDatabase();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM filmler,kategoriler,yonetmenler "
        "WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = $category_id");

    return List.generate(maps.length, (index){
      var film = maps[index];
      var k = Kategoriler(film["kategori_id"], film["kategori_ad"]);
      var y = Yonetmenler(film["yonetmen_id"], film["yonetmen_ad"]);
      return Filmler(film["film_id"], film["film_ad"], film["film_yil"], film["film_resim"], k, y);
    });
  }
}
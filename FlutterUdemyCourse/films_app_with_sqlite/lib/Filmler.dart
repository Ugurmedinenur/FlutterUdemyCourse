import 'package:films_app_with_sqlite/Kategoriler.dart';
import 'package:films_app_with_sqlite/Yonetmenler.dart';

class Filmler{
  int film_id;
  String film_ad;
  int film_yil;
  String film_resim;
  Kategoriler kategori;
  Yonetmenler yonetmen;

  Filmler(this.film_id, this.film_ad, this.film_yil, this.film_resim,
      this.kategori, this.yonetmen);
}
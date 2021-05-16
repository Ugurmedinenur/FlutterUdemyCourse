import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_parse/FilmlerResponse.dart';
import 'package:json_parse/Kisiler.dart';
import 'package:json_parse/KisilerResponse.dart';
import 'package:json_parse/mesajlar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageParse();
    kisilerParse();
    kisilerResponseParse();
    filmlerResponseParse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }

  void filmlerResponseParse() {
    String strData = '{"filmler":[{"film_id":"1","film_ad":"Interstellar","film_yil":"2015","film_resim":"interstellar.png",'
        '"kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},'
        '"yonetmen":{"yonetmen_id":"1","yonetmen_ad":"Christopher Nolan"}},'
        '{"film_id":"2","film_ad":"Inception","film_yil":"2010","film_resim":"inception.png","kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},'
        '"yonetmen":{"yonetmen_id":"1","yonetmen_ad":"Christopher Nolan"}},{"film_id":"3","film_ad":"The Pianist","film_yil":"2002","film_resim":"thepianist.png",'
        '"kategori":{"kategori_id":"3","kategori_ad":"Drama"},"yonetmen":{"yonetmen_id":"4","yonetmen_ad":"Roman Polanski"}},'
        '{"film_id":"4","film_ad":"Bir Zamanlar Anadoluda","film_yil":"2011","film_resim":"birzamanlaranadoluda.png","kategori":{"kategori_id":"3","kategori_ad":"Drama"},"yonetmen":{"yonetmen_id":"3","yonetmen_ad":"Nuri Bilge Ceylan"}},{"film_id":"5","film_ad":"The Hateful Eight","film_yil":"2015","film_resim":"thehatefuleight.png","kategori":{"kategori_id":"1","kategori_ad":"Aksiyon"},"yonetmen":{"yonetmen_id":"2","yonetmen_ad":"Quentin Tarantino"}},{"film_id":"18","film_ad":"Django","film_yil":"2013","film_resim":"django.png","kategori":{"kategori_id":"1","kategori_ad":"Aksiyon"},"yonetmen":{"yonetmen_id":"2","yonetmen_ad":"Quentin Tarantino"}}],"success":1}';
    var jsonData = json.decode(strData);

    var filmlerResponse = FilmlerResponse.fromJson(jsonData);

    print(filmlerResponse.success);
    for (var f in filmlerResponse.filmList) {
      print("*****************");
      print(f.film_id);
      print(f.film_ad);
      print(f.film_yil);
      print(f.yonetmen.yonetmen_ad);
      print(f.kategori.kategori_ad);
    }
  }

  void messageParse(){
    String strVeri = '{"mesajlar" : {"mesaj_kod" : 1, "mesaj_icerik" : "başarılı"} }';

    var jsonData = json.decode(strVeri);

    var jsonObject = jsonData["mesajlar"];
    var message = Mesajlar.fromJson(jsonObject);

    print(message.mesaj_kod.toString()+ " " + message.mesaj_icerik);
  }

  void kisilerParse(){
    var strData = '{"kisiler" : [{"kisi_id" : "1", "kisi_ad" : "Ahmet", "kisi_tel": "12345678"},{"kisi_id" : "2", "kisi_ad" : "Medine", "kisi_tel": "12345678"}]}';

    var jsonData = json.decode(strData);

    var jsonArray = jsonData["kisiler"] as List;


    List<Kisiler> kisilerList = jsonArray.map((jsonArrayObject) => Kisiler.fromJson(jsonArrayObject)).toList();

    for(var k in kisilerList){
      print("*****************");
      print(k.kisi_id);
      print(k.kisi_ad);
      print(k.kisi_tel);
    }
  }

  void kisilerResponseParse() {
    String strData = '{"success" : 1, "kisiler" : [{"kisi_id" : "1", "kisi_ad" : "Ahmet", "kisi_tel": "12345678"},{"kisi_id" : "2", "kisi_ad" : "Medine", "kisi_tel": "12345678"}]}';
    var jsonData = json.decode(strData);

    var kisilerResponse = KisilerResponse.fromJson(jsonData);

    print(kisilerResponse.success);
    for (var k in kisilerResponse.kisilerList) {
      print("*****************");
      print(k.kisi_id);
      print(k.kisi_ad);
      print(k.kisi_tel);
    }
  }

}

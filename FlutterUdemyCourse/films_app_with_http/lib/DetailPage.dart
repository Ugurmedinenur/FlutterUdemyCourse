import 'package:films_app_with_sqlite/Filmler.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {

  Filmler film;

  DetailPage({this.film});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_ad),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network("http://kasimadalan.pe.hu/filmler/resimler/${widget.film.film_resim}"),
            Text(widget.film.film_yil.toString(),style: TextStyle(fontSize: 30),),
            Text(widget.film.yonetmen.yonetmen_ad,style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}

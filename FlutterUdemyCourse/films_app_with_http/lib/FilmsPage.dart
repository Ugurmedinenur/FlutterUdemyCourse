import 'package:films_app_with_sqlite/DetailPage.dart';
import 'package:films_app_with_sqlite/FilmlerResponse.dart';
import 'package:films_app_with_sqlite/Kategoriler.dart';
import 'package:films_app_with_sqlite/Yonetmenler.dart';
import 'package:flutter/material.dart';

import 'Filmler.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;

class FilmsPage extends StatefulWidget {
  Kategoriler category;

  FilmsPage({this.category});

  @override
  _FilmsPageState createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler : ${widget.category.kategori_ad}"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future:getFilms(widget.category.kategori_id) ,
        builder: (context,snapshot){
          if(snapshot.hasData){
            var filmList = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5
              ),
              itemCount: filmList.length,
              itemBuilder: (context,index){
                var film = filmList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(film: film,)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network("http://kasimadalan.pe.hu/filmler/resimler/${film.film_resim}"),
                        ),
                        Text(film.film_ad,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else{
            return Center();
          }
        },
      ),
    );
  }

  List<Filmler> parseFilmlerResponse(String response){
    return FilmlerResponse.fromJson(json.decode(response)).filmList;
  }

  Future<List<Filmler>> getFilms(String category_id) async{
    var url = "http://kasimadalan.pe.hu/filmler/tum_filmler.php";
    var info = {"kategori_id" : category_id.toString()};
    var response = await http.post(url,body: info);
    return parseFilmlerResponse(response.body);
  }
}

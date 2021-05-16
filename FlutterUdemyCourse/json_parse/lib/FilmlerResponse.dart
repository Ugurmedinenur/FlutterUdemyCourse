import 'package:json_parse/Filmler.dart';

class FilmlerResponse{
  int success;
  List<Filmler> filmList;

  FilmlerResponse(this.success, this.filmList);

  factory FilmlerResponse.fromJson(Map<String,dynamic> json){

    var jsonArray = json["filmler"] as List;
    List<Filmler> filmList = jsonArray.map((jsonArrayObject) => Filmler.fromJson(jsonArrayObject)).toList();

    return FilmlerResponse(json["success"] as int, filmList);
  }
}
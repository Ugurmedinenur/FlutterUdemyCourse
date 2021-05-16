import 'package:films_app_with_sqlite/Kategoriler.dart';

class KategorilerResponse {
  int success;
  List<Kategoriler> categoryList;


  KategorilerResponse(this.success, this.categoryList);

  factory KategorilerResponse.fromJson(Map<String,dynamic> json){

    var jsonArray = json["kategoriler"] as List;
    List<Kategoriler> categoryList = jsonArray.map((jsonArrayObject) => Kategoriler.fromJson(jsonArrayObject)).toList();

    return KategorilerResponse(json["success"] as int, categoryList);
  }
}
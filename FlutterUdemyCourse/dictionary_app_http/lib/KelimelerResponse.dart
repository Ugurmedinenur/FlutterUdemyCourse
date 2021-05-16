import 'package:dictionary_app/Kelimeler.dart';

class KelimelerResponse{
  int success;
  List<Kelimeler> words;

  KelimelerResponse(this.success, this.words);

  factory KelimelerResponse.fromJson(Map<String,dynamic> json){
    var jsonArray  = json["kelimeler"] as List;
    List wordsList = jsonArray.map((jsonArrayObject) => Kelimeler.fromJson(jsonArrayObject)).toList();
    return KelimelerResponse(json["success"],wordsList);
  }
}
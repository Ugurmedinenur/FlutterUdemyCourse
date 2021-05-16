import 'Kisiler.dart';

class KisilerResponse{
  int success;
  List<Kisiler> kisilerList;

  KisilerResponse(this.success, this.kisilerList);

  factory KisilerResponse.fromJson(Map<String, dynamic> json){
    var jsonArray = json["kisiler"] as List;
    List<Kisiler> kisilerList = jsonArray.map((jsonArrayObject) => Kisiler.fromJson(jsonArrayObject)).toList();

    return KisilerResponse(json["success"] as int, kisilerList);
  }
}
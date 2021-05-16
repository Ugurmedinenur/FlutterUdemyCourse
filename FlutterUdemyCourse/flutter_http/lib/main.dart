import 'package:flutter/material.dart';
import 'package:flutter_http/Kisiler.dart';
import 'package:flutter_http/KisilerResponse.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

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
    //showUsers();
    //deleteUser(1211);
    //insertUser("testAd","testTel");
    updateUser(1275,"Test","Test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ),
      ),
    );
  }

  Future<List<Kisiler>> allUsers() async{
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var response = await http.get(url);
    return parseKisilerResponse(response.body);
  }

  Future<List<Kisiler>> searchUsers(String key) async{
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
    var data = {"kisi_ad":key};
    var response = await http.post(url,body: data);
    return parseKisilerResponse(response.body);
  }

  Future<void> deleteUser(int kisi_id) async{
    var url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var data = {"kisi_id":kisi_id.toString()};
    var response = await http.post(url,body: data);
    print("Silme cevap : ${response.body}");
  }

  Future<void> insertUser(String kisi_ad, String kisi_tel) async{
    var url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var data = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var response = await http.post(url,body: data);
    print("Ekle cevap : ${response.body}");
  }

  Future<void> updateUser(int kisi_id, String kisi_ad, String kisi_tel) async{
    var url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var data = {"kisi_id": kisi_id.toString(), "kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var response = await http.post(url,body: data);
    print("Ekle cevap : ${response.body}");
  }

  Future<void> showUsers() async{
    var list = await allUsers();
    var searchList = await searchUsers("Onurlu");

    for(var k in list){
      print("*****************");
      print(k.kisi_id);
      print(k.kisi_ad);
      print(k.kisi_tel);
    }

    for(var k in searchList){
      print("*****************");
      print("*****************");
      print(k.kisi_id);
      print(k.kisi_ad);
      print(k.kisi_tel);
    }
  }


  List<Kisiler> parseKisilerResponse(String response){
   /* var jsonData = json.decode(response);
    var kisilerResponse = KisilerResponse.fromJson(jsonData);
    List<Kisiler> kisilerList = kisilerResponse.kisilerList;*/
    return KisilerResponse.fromJson(json.decode(response)).kisilerList;
  }
}

import 'package:films_app_with_sqlite/FilmsPage.dart';
import 'package:films_app_with_sqlite/Kategoriler.dart';
import 'package:films_app_with_sqlite/KategorilerResponse.dart';
import 'package:flutter/material.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategoriler"),
      ),
      body: FutureBuilder<List<Kategoriler>>(
        future:getCategories() ,
        builder: (context,snapshot){
          if(snapshot.hasData){
            var categoryList = snapshot.data;
            return ListView.builder(
              itemCount: categoryList.length,
              itemBuilder: (context,index){
                var category = categoryList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FilmsPage(category: category,)));
                  },
                  child: Card(
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(category.kategori_ad,),
                        ],
                      ),
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

  List<Kategoriler> parseKategorilerResponse(String response){
    return KategorilerResponse.fromJson(json.decode(response)).categoryList;
  }

  Future<List<Kategoriler>> getCategories() async{
    var url = "http://kasimadalan.pe.hu/filmler/tum_kategoriler.php";
    var response = await http.get(url);
    return parseKategorilerResponse(response.body);
  }
}

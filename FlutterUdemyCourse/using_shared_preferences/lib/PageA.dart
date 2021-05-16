
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageA extends StatefulWidget {
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {

  Future<void> getData() async{
    var sp = await SharedPreferences.getInstance();

    String name = sp.getString("name") ?? "isim yok";
    int age = sp.getInt("age") ?? 0;
    double height = sp.getDouble("height") ?? 0.0;
    bool isWork = sp.getBool("isWork") ?? false;
    var friends = sp.getStringList("friends") ?? null;

    print("name : $name");
    print("age : $age");
    print("height : $height");
    print("isWork : $isWork");
    print(" arkadaşlar:");
    for(var a in friends){
      print(a);
    }
  }

  Future<void> delete() async{
    var sp = await SharedPreferences.getInstance();

    sp.remove("name");

  }

  Future<void> update() async{
    var sp = await SharedPreferences.getInstance();

    sp.setString("name", "Resul");

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    delete();
    getData();
    update();
    getData();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayfa A"),
      ),
      body: Center(
      ),
    );
  }
}

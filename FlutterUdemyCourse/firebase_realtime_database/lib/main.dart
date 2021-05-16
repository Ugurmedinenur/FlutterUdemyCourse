import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_realtime_database/Kisiler.dart';
import 'package:flutter/material.dart';

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

  var refUsers = FirebaseDatabase.instance.reference().child("kisiler_tablo");

  Future<void> insertUser() async{
    var info = HashMap<String,dynamic>();
    info["kisi_ad"] = "Melike";
    info["kisi_yas"] = 18;
    refUsers.push().set(info);

  }

  Future<void> deleteUser() async{
    refUsers.child("-M_NGaeBKXduSWw5zYwn").remove();

  }

  Future<void> updateUser() async{
    var info = HashMap<String,dynamic>();
    info["kisi_ad"] = "Melike";
    info["kisi_yas"] = 19;
    refUsers.child("-M_NHAjGd0_mJ1mLIyrR").update(info);

  }

  Future<void> allUsersWithChange() async{
    refUsers.onValue.listen((event) {
      var data = event.snapshot.value;

      if(data !=null){
        data.forEach((key,object){
          var user = Kisiler.fromJson(object);
          print("*************");
          print("kisi key : $key");
          print("kisi ad : ${user.kisi_ad}");
          print("kisi yaş : ${user.kisi_yas}");
        });
      }
    });
  }

  Future<void> allUsers() async{
    refUsers.once().then((DataSnapshot snapshot) {
      var data = snapshot.value;

      if(data !=null){
        data.forEach((key,object){
          var user = Kisiler.fromJson(object);
          print("*************");
          print("kisi key : $key");
          print("kisi ad : ${user.kisi_ad}");
          print("kisi yaş : ${user.kisi_yas}");
        });
      }
    });
  }

  Future<void> searchEqualTo() async{
    var query = refUsers.orderByChild("kisi_ad").equalTo("Medine");
    query.onValue.listen((event) {
      var data = event.snapshot.value;

      if(data !=null){
        data.forEach((key,object){
          var user = Kisiler.fromJson(object);
          print("*************");
          print("kisi key : $key");
          print("kisi ad : ${user.kisi_ad}");
          print("kisi yaş : ${user.kisi_yas}");
        });
      }
    });
  }

  Future<void> searchLimitTo() async{
    var query = refUsers.limitToFirst(1);
    //var query = refUsers.limitToLast(1);
    query.onValue.listen((event) {
      var data = event.snapshot.value;

      if(data !=null){
        data.forEach((key,object){
          var user = Kisiler.fromJson(object);
          print("*************");
          print("kisi key : $key");
          print("kisi ad : ${user.kisi_ad}");
          print("kisi yaş : ${user.kisi_yas}");
        });
      }
    });
  }

  Future<void> searchValueRage() async{
    var query = refUsers.orderByChild("kisi_yas").startAt(18).endAt(43);
    query.onValue.listen((event) {
      var data = event.snapshot.value;

      if(data !=null){
        data.forEach((key,object){
          var user = Kisiler.fromJson(object);
          print("*************");
          print("kisi key : $key");
          print("kisi ad : ${user.kisi_ad}");
          print("kisi yaş : ${user.kisi_yas}");
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //insertUser();
    //deleteUser();
    //updateUser();
    //allUsers();
    //searchEqualTo();
    //searchLimitTo();
    searchValueRage();
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
          children: [
          ],
        ),
      ),
    );
  }
}

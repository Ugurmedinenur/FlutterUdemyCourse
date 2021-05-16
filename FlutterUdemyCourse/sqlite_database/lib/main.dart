import 'package:flutter/material.dart';
import 'package:sqlite_database/KisilerDao.dart';

import 'Kisiler.dart';

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
    updateUser();
    getUsers();
    control();
    getUser();
    search();
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

  Future<void> getUsers() async{
    var userList = await KisilerDao().getAll();

    for(Kisiler k in userList){
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi yaş : ${k.kisi_yas}");
      print("**************");
    }
  }
  Future<void> insertUser() async{
    await KisilerDao().insert("Medine", 43);

  }

  Future<void> deleteUser() async{
    await KisilerDao().delete(3);

  }

  Future<void> updateUser() async{
    await KisilerDao().update(2,"Medine",3);

  }

  Future<void> control() async{
    int result = await KisilerDao().control("ahmet");
    print(result);

  }
  Future<void> getUser() async{
    var user = await KisilerDao().get(1);

    print("Kişi id : ${user.kisi_id}");
    print("Kişi ad : ${user.kisi_ad}");
    print("Kişi yaş : ${user.kisi_yas}");
    print("**************");
  }

  Future<void> search() async{
    var userList = await KisilerDao().search("a");

    for(Kisiler k in userList){
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi yaş : ${k.kisi_yas}");
      print("**************");
    }
  }

  Future<void> random() async{
    var userList = await KisilerDao().getRandomLimitedUsers();

    for(Kisiler k in userList){
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi yaş : ${k.kisi_yas}");
      print("**************");
    }
  }


}

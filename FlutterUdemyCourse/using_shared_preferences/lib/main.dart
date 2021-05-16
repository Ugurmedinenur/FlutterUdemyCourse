import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:using_shared_preferences/PageA.dart';

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

  Future<void> insert() async{
    var sp = await SharedPreferences.getInstance();
    
    sp.setString("name", "Medine");
    sp.setInt("age", 10);
    sp.setDouble("height", 1.78);
    sp.setBool("isWork", true);

    var friends = <String>["Ali","Ayşe"];
    sp.setStringList("friends", friends);

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
            ElevatedButton(
              child: Text("Giriş Yap"),
              onPressed: (){
                insert();
                Navigator.push(context, MaterialPageRoute(builder: (context) => PageA()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

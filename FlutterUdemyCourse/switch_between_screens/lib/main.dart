import 'package:flutter/material.dart';
import 'package:switch_between_screens/PageA.dart';
import 'package:switch_between_screens/Users.dart';

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
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PageA(Users(name: "Medine",age: 23, height:1.80,isWork: true,))));
                },
                child: Text("Sayfa A'ya geç")
            ),
          ],
        ),
      ),

    );
  }
}


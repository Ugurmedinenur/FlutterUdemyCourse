import 'package:flutter/material.dart';
import 'package:using_tab/Page1.dart';
import 'package:using_tab/Page3.dart';

import 'Page2.dart';

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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Using Tab"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Bir",),
              Tab(icon: Icon(Icons.looks_two,color: Colors.cyanAccent,),),
              Tab(text: "Üç", icon: Icon(Icons.looks_3,color: Colors.cyanAccent,),),
            ],
          ),
        ),
        body:TabBarView(
          children: [
            Page1(),
            Page2(),
            Page3(),
          ],
        ),

      ),
    );
  }
}

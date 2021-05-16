import 'package:bottom_navigation_bar/Page1.dart';
import 'package:bottom_navigation_bar/Page2.dart';
import 'package:bottom_navigation_bar/Page3.dart';
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
        primarySwatch: Colors.deepPurple,
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

  var pageList  = [Page1(),Page2(),Page3()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: pageList[index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: "Bir"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
          ),
        ],
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.orange,
        currentIndex: index,
        onTap: (index){
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:using_drawer/Page1.dart';
import 'package:using_drawer/Page2.dart';
import 'package:using_drawer/Page3.dart';

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

  var pageList = [Page1(),Page2(),Page3()];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: pageList[index],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("BAşlık Tasarım", style: TextStyle(color: Colors.white, fontSize: 30),),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              title: Text("Sayfa 1"),
              onTap: (){
                setState(() {
                  this.index = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Sayfa 2"),
              leading: Icon(Icons.looks_two),
              onTap: (){
                setState(() {
                  this.index = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Sayfa 3", style: TextStyle(color: Colors.pink,),),
              onTap: (){
                setState(() {
                  this.index = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

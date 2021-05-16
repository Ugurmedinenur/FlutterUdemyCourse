import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
    return Scaffold(
      appBar: AppBar(
        title: Text("space"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0), // EdgeInsets.only(top:8.0,left:8.0) da diyebiliriz
            child: Container(width: 80,height: 80,color: Colors.blue,),
          ),
         /* SizedBox(
            width: 200,
            height: 400,

          ),*/
          //Spacer(flex: 30,),
          Container(width: 50,height: 50,color: Colors.blue,),
          //Spacer(flex: 70,),
          Container(width: 100,height: 100,color: Colors.blue,),
        ],
      ),
    );
  }
}

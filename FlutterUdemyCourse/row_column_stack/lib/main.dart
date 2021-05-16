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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("row column stack"),
      ),
      body: Stack(
        children: [
          Container(width: 400,height: 400,color: Colors.black,),
          Row(
            children: [
              Container(width: 100,height: 100,color: Colors.red,),
              Container(width: 100,height: 100,color: Colors.blue,),
              Column(
                children: [
                  Container(width: 100,height: 100,color: Colors.yellow,),
                  Container(width: 100,height: 100,color: Colors.green,),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

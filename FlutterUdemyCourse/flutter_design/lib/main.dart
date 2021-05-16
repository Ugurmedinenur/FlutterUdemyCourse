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
        title: Text("Flutter design"),
      ),
      body: Stack( // Row , Column, Stack
        children: [
          Text("data"),
          Container(width: 100,height: 100,color: Colors.red,),
          Container(width: 80,height: 80,color: Colors.blue,),
          Container(width: 50,height: 50,color: Colors.green,),
        ],
      ),

    );
  }
}

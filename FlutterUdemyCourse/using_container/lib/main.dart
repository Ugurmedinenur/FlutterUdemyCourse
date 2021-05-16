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
        title: Text("Container"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            width: 200,
            height: 200,
            child: Center(
              child: Text("Merhaba"),
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                color: Colors.blue,
                width: 3.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top:10.0,left: 10.0),
            width: 200,
            height: 200,
            color: Colors.red,
            child: Text("Merhaba"),
          ),
        ],
      ),
    );
  }
}

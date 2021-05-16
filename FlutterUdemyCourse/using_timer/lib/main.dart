import 'dart:async';

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

  Timer timer;
  int time = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Kalan süre : $time sn",style: TextStyle(fontSize: 30,)),
            ElevatedButton(
              child: Text("BAŞLA"),
              onPressed: (){
                timer = Timer.periodic(Duration(seconds: 1), (timer) {
                  setState(() {
                    if(time <1){
                      time = 10;
                      timer.cancel();
                    }
                    else{
                      time--;
                    }
                  });
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}

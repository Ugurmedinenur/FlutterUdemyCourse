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

  bool kotlin_state = false;
  bool dart_state = false;

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
            CheckboxListTile(
              title: Text("Kotlin"),
              value: kotlin_state,
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.red,
              activeColor: Colors.yellow,
              onChanged: (bool? data){
                print("Kotlin seçildi  : $data");
                setState(() {
                  kotlin_state = data!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Dart"),
              value: dart_state,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? data){
                print("Dart seçildi  : $data");
                setState(() {
                  dart_state = data!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

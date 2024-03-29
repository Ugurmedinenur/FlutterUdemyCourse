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

  int selected_button = 0;

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
            RadioListTile(
              title: Text("Galatasaray"),
              value: 1,
              groupValue: selected_button,
              activeColor: Colors.red,
              onChanged: (int? data){
                setState(() {
                  selected_button = data!;
                });
                print("galatasaray");
              },
            ),
            RadioListTile(
              title: Text("Fenerbahçe"),
              value: 2,
              groupValue: selected_button,
              onChanged: (int? data){
                setState(() {
                  selected_button = data!;
                });
                print("Fenerbahçe");
              },
            ),
          ],
        ),
      ),
    );
  }
}

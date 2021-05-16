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

  var state_toggle = [false,true,false];
  int index = 0;

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
            ToggleButtons(
              children: [
              Icon(Icons.looks_one),
              Icon(Icons.looks_two),
              Icon(Icons.looks_3),
              ],
              isSelected: state_toggle,
              color: Colors.pink,
              selectedColor: Colors.deepPurpleAccent,
              fillColor: Colors.green,
              onPressed: (int index){
                this.index = index;
                print("${index+1}. toggle seçildi");

                setState(() {
                  state_toggle[index] = !state_toggle[index];
                });
              },
            ),
          ],
        ),
      ),

    );
  }
}

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
        title: Text("widget customize"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlueSquare(),
            SizedBox(height: 20,),
            RedSquare(),
            SizedBox(height: 20,),
            CustomizeText("Merhaba", 30.0)
          ],
        ),
      ),

    );
  }
}

class BlueSquare extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(width: 50,height: 50,color: Colors.blue,);
  }

}
class RedSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 50,height: 50,color: Colors.red,);
  }
}
class CustomizeText extends StatelessWidget {
  String container;
  double textSize;

  CustomizeText(this.container, this.textSize);

  @override
  Widget build(BuildContext context) {
    return Text(container,style: TextStyle(fontSize: textSize),);
  }
}



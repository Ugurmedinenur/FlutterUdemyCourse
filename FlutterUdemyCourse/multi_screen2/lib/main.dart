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

    var screen = MediaQuery.of(context);
    final double screen_height = screen.size.height;
    final double screen_width = screen.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: screen_height/100),
            child: SizedBox(
              width: screen_width/2,
                height: screen_height/5,
                child: Image.asset("images/stevejobs@3x.png")
            ),
          ),
          Container(width: screen_width, height: screen_height/4,color: Colors.red,),
          Text("Merhaba", style: TextStyle(fontSize: screen_width/10),),
        ],
      ),

    );
  }
}

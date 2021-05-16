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
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
        title: Text("İlham ver"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(top: screen_height/100, bottom: screen_height/100),
                child: SizedBox(
                  width: screen_width/4,
                    child: Image.asset("images/stevejobs@3x.png")
                ),
              ),
            Text("Steve Jobs",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: screen_width/25,
              ),
            ),
            Spacer(),
            Padding(
              padding:  EdgeInsets.only(left: screen_width/100,right: screen_width/100),
              child: Text("deneme",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screen_width/25,
              ),
              ),
            ),
            Spacer(),
            Padding(
              padding:  EdgeInsets.only(bottom: screen_height/100),
              child: SizedBox(
                width: screen_width/2,
                height: screen_height/15,
                child: ElevatedButton(
                  child: Text("İLHAM VER:",style: TextStyle(fontSize: screen_width/25),),
                    onPressed: (){
                      print("ilham verildi.");
                    },
                  style: ElevatedButton.styleFrom(
                    primary : Colors.redAccent,
                    textStyle: TextStyle(
                      color: Colors.white,
                    )
                  ),

                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

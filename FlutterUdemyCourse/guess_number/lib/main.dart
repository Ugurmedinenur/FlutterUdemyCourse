import 'package:flutter/material.dart';
import 'package:guess_number/GuessPage.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Tahmin Oyunu",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 36,
                fontWeight: FontWeight.bold
              ),
            ),
            Image.asset("images/zar_resim.png"),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("OYUN BAŞLA", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> GuessPage()));
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}

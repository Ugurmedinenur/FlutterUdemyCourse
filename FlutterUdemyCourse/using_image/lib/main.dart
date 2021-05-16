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

  String imagePath = "stevejobs@3x.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/" + imagePath),
            Image.network("https://im.haberturk.com/yerel_haber/2020/03/31/ver1585634821/76788028_620x410.jpg"),
            FadeInImage.assetNetwork(
                placeholder: "images/placeholder.png",
                image: "http://kasimadalan.pe.hu/filmler/resimler/django.png"
            ),
            ElevatedButton(
              child: Text("Resim1"),
              onPressed: (){
                setState(() {
                  imagePath = "stevejobs@3x.png";
                });
              },
            ),
            ElevatedButton(
              child: Text("Resim2"),
              onPressed: (){
                setState(() {
                  imagePath = "stevejobs@1x.png";
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

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

  Future<int> factorial(int num) async{
    var result = 1;
    for(var i = 1; i<=num; i++){
      result *= i;
    }
    return result;

  }

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
            FutureBuilder<int>(
              future: factorial(5),
              builder: (context,snapshot){
                if(snapshot.hasError){
                  print("Hata Sonucu: ${snapshot.error}");
                }
                if(snapshot.hasData){
                  return Text("Sonuç : ${snapshot.data}");
                }
                else{
                  return Text("Gösterilecek veri yok.");
                }
              }
            ),
          ],
        ),
      ),

    );
  }
}

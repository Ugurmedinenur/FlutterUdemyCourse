import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
  var tf = TextEditingController();

  Future<void> insert() async{
    var ad = await getApplicationDocumentsDirectory();

    var url = await ad.path;
    
    var file = File("$url/dosyam.txt");

    file.writeAsString(tf.text);

    tf.text = "";
  }

  Future<void> read() async{
    try{
      var ad = await getApplicationDocumentsDirectory();

      var url = await ad.path;
      var file = File("$url/dosyam.txt");

      String data = await file.readAsString();

      tf.text = data;
    }
    catch(e){
      return e.toString();
    }
  }

  Future<void> delete() async{
    var ad = await getApplicationDocumentsDirectory();

    var url = await ad.path;
    var file = File("$url/dosyam.txt");

    if(file.existsSync()){
      file.delete();
    }
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
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tf,
                decoration: InputDecoration(
                  hintText: "Veri Giriniz",
                ),

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("Yaz"),
                  onPressed: (){
                    insert();
                  },
                ),
                ElevatedButton(
                  child: Text("Oku"),
                  onPressed: (){
                    read();
                  },
                ),
                ElevatedButton(
                  child: Text("Sil"),
                  onPressed: (){
                    delete();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

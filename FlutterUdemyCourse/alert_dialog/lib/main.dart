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

  var tf = TextEditingController();

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
            ElevatedButton(
              child: Text("Basit alert"),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Başlık"),
                      content: Text("İçerik"),
                      actions: [
                        TextButton(
                          child: Text("İptal"),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text("Tamam"),
                          onPressed: (){
                            print("Tamam seçildi.");
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  }
                );
              },
            ),
            ElevatedButton(
              child: Text("Özel alert"),
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Özel Alert",style: TextStyle(color: Colors.white),),
                        content: SizedBox(
                          height: 80,
                          child: Column(
                            children: [
                              TextField(
                                controller: tf,
                                decoration: InputDecoration(
                                  labelText: "Veri",
                                ),
                              ),
                            ],
                          ),
                        ),
                        backgroundColor: Colors.indigoAccent,
                        actions: [
                          TextButton(
                            child: Text("İptal", style: TextStyle(color: Colors.white),),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Text("Veri Oku", style: TextStyle(color: Colors.white),),
                            onPressed: (){
                              String data = tf.text;
                              print("Veri okundu : $data");
                              tf.text = "";
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    }
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

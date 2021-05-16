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
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PopupMenuButton(
              icon: Icon(Icons.open_in_new),
              itemBuilder: (context) =>[
                PopupMenuItem(
                  value: 1,
                  child: Text("Sil",style: TextStyle(color: Colors.red),),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Güncelle",style: TextStyle(color: Colors.red),),
                ),
              ],
              onCanceled: (){
                print("Seçim yapılmadı");
              },
              onSelected: (menuItemValue){
                if(menuItemValue == 1){
                  print("Veri silindi");
                }
                if(menuItemValue == 2){
                  print("Veri günccellendi");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

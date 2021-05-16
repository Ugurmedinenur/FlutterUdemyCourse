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
        primarySwatch: Colors.red,
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

  var search = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: search ?
            TextField(
              decoration: InputDecoration(hintText: "bir şeyler yaz."),
              onChanged: (key){
                print("anahtar : $key");
              },
            )
            :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Başlık",style: TextStyle(color: Colors.white, fontSize: 16.0),),
            Text("Alt Başlık",style: TextStyle(color: Colors.white, fontSize: 12.0),),

          ],
        ),
        centerTitle: false,
        leading: IconButton(
          tooltip: "Menu Icon",
          icon: Icon(Icons.dehaze),
          onPressed: (){
            print("Menu Icon tıklandı");
          },
        ),
        actions: [
          search ?
          IconButton(
            tooltip: "İptal",
            icon: Icon(Icons.cancel),
            onPressed: (){
              print("iptal tıklandı");
              setState(() {
                search = false;
              });
            },
          ) :
          IconButton(
            tooltip: "Ara",
            icon: Icon(Icons.search),
            onPressed: (){
              print("arama tıklandı");
              setState(() {
                search = true;
              });
            },
          ),
          TextButton(
            child: Text("ÇIKIŞ",style: TextStyle(color: Colors.white),),
            onPressed: (){
              print("Çıkış tıklandı.");
            },
          ),
          PopupMenuButton(
            child: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Sil"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Güncelle"),
              ),
            ],
            onSelected: (menuItemValue){
              if(menuItemValue == 1){
                print("Sil Tıklandı.");
              }
              if(menuItemValue == 2){
                print("Güncelle Tıklandı.");
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ),
      ),
    );
  }
}

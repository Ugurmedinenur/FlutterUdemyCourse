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

  var countries = ["Türkiye","Almanya","Fransa"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body:SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: countries.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                print("Seçilen Ülke : ${countries[index]}");
                //Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(countries[index])));

              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            print("Text ile Seçilen Ülke : ${countries[index]}");
                          },
                          child: Text(countries[index]),
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
                              print("${countries[index]} silindi.");
                            }
                            if(menuItemValue == 2){
                              print("${countries[index]} güncellendi.");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

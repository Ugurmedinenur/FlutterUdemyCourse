import 'package:dictionary_app/DetailPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Kelimeler.dart';

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

  bool isSearch = false;
  String key_search = "";

  var refWords = FirebaseDatabase.instance.reference().child("kelimeler");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch ?
            TextField(
              decoration: InputDecoration(hintText: "Arama keimesini yazınız"),
              onChanged: (searchResult){
                print("Arama Sonucu : $searchResult");
                setState(() {
                  key_search = searchResult;
                });
              },
            )
            : Text("Sözlük Uygulaması"),
        actions: [
          isSearch ?
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                isSearch = false;
                key_search = "";
              });
            },
          )
          : IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                isSearch = true;
              });
            },
          ),
        ],
      ),
      body: StreamBuilder<Event>(
        stream: refWords.onValue,
        builder: (context,event){
          if(event.hasData){
            var wordList = <Kelimeler>[];
            var data = event.data.snapshot.value;

            if(data != null){
              data.forEach((key,object){

                var word = Kelimeler.fromJson(key, object);
                if(isSearch){
                  if(word.ingilizce.contains(key_search)){
                    wordList.add(word);
                  }
                }
                else{
                  wordList.add(word);
                }
              });
            }
            return ListView.builder(
              itemCount: wordList.length,
              itemBuilder: (context, index){
                var word = wordList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(word : word)));
                  },
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(word.ingilizce,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(word.turkce),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else{
            return Center();
          }
        },

      ),
    );
  }

}

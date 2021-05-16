import 'package:dictionary_app/DetailPage.dart';
import 'package:dictionary_app/KelimelerDao.dart';
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
  String key = "";


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
                  key = searchResult;
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
                key = "";
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
      body: FutureBuilder<List<Kelimeler>>(
        future: isSearch ? search(key) : getAllWords(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var wordList = snapshot.data;
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

  Future<List<Kelimeler>> getAllWords() async{
    var wordList = await KelimelerDao().allWords();
    return wordList;
  }

  Future<List<Kelimeler>> search(String key) async{
    var wordList = await KelimelerDao().search(key);
    return wordList;
  }
}

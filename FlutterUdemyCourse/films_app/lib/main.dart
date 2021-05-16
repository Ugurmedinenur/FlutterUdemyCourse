import 'package:films_app/DetailPage.dart';
import 'package:flutter/material.dart';

import 'Films.dart';

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
        primarySwatch: Colors.deepPurple,
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

  Future<List<Films>> getData() async{
    var filmsList = <Films>[
      Films(1, "Anadoluda", "anadoluda.png", 15.99),
      Films(2, "Django", "django.png", 9.99),
      Films(3, "Inception", "inception.png", 7.99),
      Films(4, "Intrestellar", "interstellar.png", 21.99),
      Films(5, "The Pianist", "thepianist.png", 17.99)
    ];
    return filmsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler"),
      ),
      body: FutureBuilder<List<Films>> (
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var filmList = snapshot.data;
            return GridView.builder(
              itemCount: filmList!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemBuilder: (context,index){
                var film = filmList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(film: film)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("images/${film.film_image}"),
                        ),
                        Text(film.film_name, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("${film.film_price} \u{20BA}", style: TextStyle(fontSize: 16),),
                      ],
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

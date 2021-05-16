import 'package:flutter/material.dart';
import 'package:food_app/DetailPage.dart';

import 'Foods.dart';

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

  Future<List<Foods>> getData() async{
    var foodsList = <Foods>[
    Foods(1, "Köfte", "kofte.png",15.99),
    Foods(2, "Ayran", "ayran.png",15.99),
    Foods(3, "Fanta", "fanta.png",15.99),
    Foods(4, "Makarna", "makarna.png",15.99),
    Foods(5, "Kadayıf", "kadayif.png",15.99),
    Foods(6, "Baklava", "baklava.png",15.99),
    ];
    return foodsList;
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Foods>> (
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var foodList = snapshot.data;
            return ListView.builder(
              itemCount: foodList!.length,
              itemBuilder: (context,index){
                var food = foodList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(food: food)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                           width: 100,
                          child: Image.asset("images/${food.food_image}")
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(food.food_name,style: TextStyle(color: Colors.black,fontSize: 25),),
                              SizedBox(height: 30,),
                              Text("${food.food_price} \u{20BA}" ,style: TextStyle(color: Colors.blue, fontSize: 20),)
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}

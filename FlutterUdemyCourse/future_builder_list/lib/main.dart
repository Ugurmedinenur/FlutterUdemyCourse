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
      body: FutureBuilder<List<String>>(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var countryList = snapshot.data;
            return ListView.builder(
              itemCount: countryList.length,
              itemBuilder: (context,index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Text(countryList[index]),
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

  Future<List<String>> getData() async{
    var countries = ["Türkiye","Almanya","Fransa""İngiltere"];

    return countries;
  }
}

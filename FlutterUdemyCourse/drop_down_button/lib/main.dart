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

  // ignore: deprecated_member_use
  var countries = List<String>();
  String country = "Türkiye";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countries.add("Türkiye");
    countries.add("İtalya");
    countries.add("Almanya");
    countries.add("Rusya");
    countries.add("İngiltere");
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
            DropdownButton<String>(
              value: country,
              items: countries.map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text("Ülke: $value", style: TextStyle(color: Colors.red, fontSize: 20),),
                );
              }).toList(),
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (String data){
                setState(() {
                  country = data;
                });
              },
            ),
            Text("Seçilen Ülke : $country"),
          ],
        ),
      ),
    );
  }
}

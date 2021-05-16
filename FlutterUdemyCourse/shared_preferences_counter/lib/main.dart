import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  int counter = 0 ;

  Future<void> count() async{
    var sp = await SharedPreferences.getInstance();

    counter = sp.getInt("counter") ?? 0;

    setState(() {
      counter++;
    });

    sp.setInt("counter", counter);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count();
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
            Text("Açılış Sayısı: $counter",style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}

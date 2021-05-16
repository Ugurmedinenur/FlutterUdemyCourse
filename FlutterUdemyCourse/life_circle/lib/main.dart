import 'package:flutter/material.dart';
import 'package:life_circle/PageA.dart';

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

class _HomePageState extends State<HomePage> with WidgetsBindingObserver{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState() çalıştı");
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    if(state == AppLifecycleState.inactive){
      print("inActive() çalıştı");
    }
    if(state == AppLifecycleState.paused){
      print("paused() çalıştı");
    }
    if(state == AppLifecycleState.resumed){
      print("resumed() çalıştı");
    }
    if(state == AppLifecycleState.detached){
      print("detached() çalıştı");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build() çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PageA()));
              }, child: Text("Tıkla")),
          ],
        ),
      ),
    );
  }
}



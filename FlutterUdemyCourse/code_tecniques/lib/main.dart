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

  bool control = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ((){
              if(control){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done),
                    Text("Doğru"),
                  ],
                );
              }
              else{
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cancel),
                    Text("Yanlış"),
                  ],
                );
              }
            }()),
            Visibility(
                visible: control,
                child: Text("Merhaba")
            ),
            Text(
              control ? "Medine": "Resul",
              style: TextStyle(
                color: control ? Colors.blue : Colors.red,
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    control = true;
                  });
                },
                child: Text("Durum 1"),
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    control = false;
                  });
                },
                child: Text("Durum 2")),
          ],
        ),
      ),
      
    );
  }
}

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

  var tfController = TextEditingController();
  String data = "";

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfController,
                obscureText: true, // şifreler için
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.center,
                maxLength: 4, // kaç karakter girecek
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Yazınız.",
                  hintStyle: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                  ),
                  filled: true,
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  prefixIcon: Icon(Icons.print),
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                data = tfController.text;
              });
            }, 
                child: Text("Veriyi al.")
            ),
            Text("Gelen veri $data",
            style: TextStyle(
              color: Colors.green,
              backgroundColor: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            ),
          ],
        ),
      ),

    );
  }
}

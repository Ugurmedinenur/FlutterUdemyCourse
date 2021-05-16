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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Varsayılan"),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Merhaba")),
                );
              },
            ),
            ElevatedButton(
              child: Text("Snackbar Action"),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Silmek istiyor musunuz?"),
                    action: SnackBarAction(
                      label: "Evet",
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Silindi")),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("Snackbar özel"),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("İnternet bağlantısı yok!",style: TextStyle(color: Colors.indigoAccent),),
                    backgroundColor: Colors.white,
                    action: SnackBarAction(
                      label: "Tekrar dene",
                      textColor: Colors.red,
                      onPressed: (){
                        print("Tekrar denendi.");
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

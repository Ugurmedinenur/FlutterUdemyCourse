import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:switch_between_screens/main.dart';

class PageB extends StatefulWidget {


  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {


  Future<bool> backButton(BuildContext context) async {
    print("Geri dönüş tuşu tıklandı.");
    Navigator.of(context).popUntil((route) => route.isFirst);
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page B"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            print("Appbar geri tuşuna tıkla.");
            Navigator.pop(context);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: ()=> backButton(context) ,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text("Ana sayfaya git.")
              ),
              ElevatedButton(
                  onPressed: (){
                      Navigator.pop(context);
                  },
                  child: Text("Geldiğin sayfaya dön")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text("Ana sayfaya dön.")
              ),
            ],
          ),
        ),
      ),

    );
  }
}

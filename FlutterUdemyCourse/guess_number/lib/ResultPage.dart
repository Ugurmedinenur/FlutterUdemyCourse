import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {

  bool result = true;

  ResultPage({required this.result});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(widget.result ? "images/mutlu_resim.png" : "images/uzgun_resim.png"),
            Text(widget.result ? "Kazandınız." : "Kabettiniz.", style: TextStyle(color: Colors.black54, fontSize: 36, fontWeight: FontWeight.bold),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tekrar dene", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
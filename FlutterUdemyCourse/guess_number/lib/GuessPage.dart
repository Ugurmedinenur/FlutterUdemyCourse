import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guess_number/ResultPage.dart';

class GuessPage extends StatefulWidget {
  @override
  _GuessPageState createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {

  int rights = 5;
  var tfGuess = TextEditingController();
  int num = 0;
  String help = "";
  var visibility = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    num = Random().nextInt(101);
    print("Sayi: $num");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Kalan Hak : $rights", style: TextStyle(color: Colors.pink, fontSize: 30,)),
            Visibility(visible: visibility,child: Text("Yardım : $help", style: TextStyle(color: Colors.black54, fontSize: 24,))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfGuess,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("TAHMİN ET", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                ),
                onPressed: (){
                  setState(() {
                    rights--;
                  });
                  int guess = int.parse(tfGuess.text);
                  if(guess == num){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ResultPage(result: true,)));
                    return;
                  }
                  if(guess > num){
                    setState(() {
                      help = "Tahmini azalt";
                      visibility = true;
                    });
                  }
                  if(guess <num){
                    setState(() {
                      help = "Tahmini arttır";
                      visibility = true;
                    });
                  }
                  if(rights == 0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ResultPage(result: false,)));
                    return;
                  }
                  tfGuess.text = "";

                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
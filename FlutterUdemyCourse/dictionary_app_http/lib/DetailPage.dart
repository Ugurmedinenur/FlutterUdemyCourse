import 'package:dictionary_app/Kelimeler.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {

  Kelimeler word;

  DetailPage({this.word});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sözlük Uygulaması"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.word.ingilizce,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.pink),),
            Text(widget.word.turkce,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          ],
        ),
      ),
    );
  }
}

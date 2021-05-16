import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  String country;


  DetailPage(this.country);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body:Center(
        child: Text(widget.country,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 ),),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatefulScreen extends StatefulWidget {
  @override
  _StatefulScreenState createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Merhaba"),
          ],
        ),
      ),

    );
  }
}
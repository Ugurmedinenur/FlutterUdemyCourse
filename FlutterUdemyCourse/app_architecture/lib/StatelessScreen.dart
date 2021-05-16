import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatelessScreen extends StatelessWidget {
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
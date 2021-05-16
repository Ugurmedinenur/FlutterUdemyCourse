import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageA extends StatefulWidget {
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactive()");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose()");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page A"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
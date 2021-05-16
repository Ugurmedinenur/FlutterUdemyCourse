import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PageB.dart';
import 'Users.dart';

class PageA extends StatefulWidget {
  Users user;


  PageA(this.user);

  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page A"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PageB()));
                },
                child: Text("Sayfa B'ya geç")
            ),
            Text("İsim: ${widget.user.name}"),
            Text("Yaş: ${widget.user.age}"),
            Text("Boy: ${widget.user.height}"),
            Text("Çalışıyor mu?: ${widget.user.isWork}"),
          ],
        ),
      ),

    );
  }
}

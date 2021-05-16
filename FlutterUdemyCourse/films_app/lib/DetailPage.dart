import 'package:flutter/material.dart';

import 'Films.dart';

class DetailPage extends StatefulWidget {

  Films film;

  DetailPage({required this.film});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.film.film_image}"),
            Text("${widget.film.film_price} \u{20BA}", style: TextStyle(fontSize: 48),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Kirala", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: (){
                  print("${widget.film.film_name} kiralandı.");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/Foods.dart';

class DetailPage extends StatefulWidget {
  Foods food;

  DetailPage({required this.food});

  @override
  _DetailPageState createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemekler"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.food.food_image}"),
            Text("${widget.food.food_price} \u{20BA}" ,style: TextStyle(color: Colors.blue, fontSize: 48),),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                child: Text("SİPARİŞ VER",style: TextStyle(color: Colors.white,),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                onPressed: (){
                  print("${widget.food.food_name} sipariş verildi.");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

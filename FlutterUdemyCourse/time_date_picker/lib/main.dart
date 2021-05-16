import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var tfDate = TextEditingController();
  var tfClock = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: tfClock,
              decoration: InputDecoration(
                hintText: "Saat giriniz",
              ),
              onTap: () => getTime(),
            ),
            TextField(
              controller: tfDate,
              decoration: InputDecoration(
                hintText: "Tarih Giriniz giriniz",
              ),
              onTap: () => getDate(),
            )
          ],
        ),
      ),
    );
  }

  void getTime(){
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    ).then((clock) {
      setState(() {
        tfClock.text = "${clock.hour} : ${clock.minute}";
      });
    });
  }
  void getDate(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050)
    ).then((date) {
      setState(() {
        tfDate.text = "${date.day} / ${date.month} / ${date.year}";
      });
    });
  }
}

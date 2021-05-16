import 'package:flutter/material.dart';
import 'package:login_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String userName;
  String password;

  Future<void> readInfo() async {

    var sp = await SharedPreferences.getInstance();
    setState(() {
      userName = sp.getString("userName")?? "kullanıcı adı yok";
      password = sp.getString("password")?? "şifre yok";
    });

  }

  Future<void> logOut() async {

    var sp = await SharedPreferences.getInstance();
    sp.remove("userName");
    sp.remove("password");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              logOut();
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Kullanıcı Adı  : $userName",style: TextStyle(fontSize: 30),),
              Text("Parola : $password",style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
      ),

    );
  }
}

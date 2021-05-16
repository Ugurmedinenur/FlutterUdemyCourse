import 'package:flutter/material.dart';
import 'package:login_app/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Future<bool> readInfo() async {

    var sp = await SharedPreferences.getInstance();
    String userName = sp.getString("userName")?? "kullanıcı adı yok";
    String password = sp.getString("password")?? "şifre yok";

    if(userName == "admin" && password =="123"){
      return true;
    }
    else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: readInfo(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            bool control = snapshot.data;
            return control ? HomePage() : LoginPage();
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var tfUserName = TextEditingController();
  var tfPassword = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> loginControl() async {
    var userName = tfUserName.text;
    var password = tfPassword.text;

    if(userName == "admin" && password =="123"){

      var sp = await SharedPreferences.getInstance();
      sp.setString("userName", userName);
      sp.setString("password", password);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kullanıcı adı veya şifre yanlış")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double screen_height = screen.size.height;
    final double screen_width = screen.size.width;
    return Scaffold(
      key: scaffoldKey,
     backgroundColor: Colors.deepPurple,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: screen_height/20),
                child: SizedBox(
                  width: screen_width/3,
                    child: Image.asset("images/logo.png")
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screen_height/30),
                child: TextField(
                  controller: tfUserName,
                  decoration: InputDecoration(
                    hintText: "Kullanıcı Adı",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screen_height/30),
                child: TextField(
                  controller: tfPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "şifre",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screen_height/30),
                child: SizedBox(
                  width: screen_width/1.2,
                  height: screen_height/12,
                  child: ElevatedButton(
                      onPressed: (){
                        loginControl();
                      },
                      child: Text("GİRİŞ YAP", style: TextStyle(fontSize: screen_width/25),
                      ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("Yardım seçildi.");
                },
                child: Text(
                  "Yardım?",
                  style: TextStyle(
                    color : Colors.pink,
                    fontSize: screen_width/30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

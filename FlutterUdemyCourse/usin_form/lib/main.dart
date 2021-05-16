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

  var formKey = GlobalKey<FormState>();
  var tfUserName = TextEditingController();
  var tfPassword = TextEditingController();

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
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: tfUserName,
                    decoration: InputDecoration(hintText: "Kullanıcı Adı"),
                    validator: (tfInput){
                      if(tfInput!.isEmpty){
                        return "Kullanıcı adı giriniz.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: tfUserName,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Parola"),
                    validator: (tfInput){
                      if(tfInput!.isEmpty){
                        return "Parola giriniz.";
                      }
                      if(tfInput.length < 6){
                        return "Parola en az 6 haneden oluşmalıdır.";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    child: Text("GİRİŞ"),
                    onPressed: (){
                      bool control = formKey.currentState!.validate();

                      if(control){
                        String userName = tfUserName.text;
                        String password = tfPassword.text;
                        print("Kullanıcı adı $userName - Şifre : $password");
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}

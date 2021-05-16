import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

  var flp = FlutterLocalNotificationsPlugin();

  Future<void> setup() async{
    var androidSetting = AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosSetting = IOSInitializationSettings();
    var setupSettings = InitializationSettings(androidSetting, iosSetting);
    await flp.initialize(setupSettings,onSelectNotification: selectNotification);
  }

  Future<void> selectNotification(String payload) async{
    if(payload != null){
      print("Bİldirim seçildi");
    }
  }
  Future<void> showNotification() async{
    var android = AndroidNotificationDetails("Kanal id", "Kanal Başlık", "Kanal Açıklama",
    importance: Importance.Max);
    var ios = IOSNotificationDetails();
    var notificationDetails = NotificationDetails(android,ios);
    
    await flp.show(0, "title", "body", notificationDetails,payload: "payload");
  }

  Future<void> showDelayedNotification() async{
    var android = AndroidNotificationDetails("Kanal id", "Kanal Başlık", "Kanal Açıklama",
        importance: Importance.Max);
    var ios = IOSNotificationDetails();
    var notificationDetails = NotificationDetails(android,ios);
    var delay = DateTime.now().add(Duration(seconds: 5));
    await flp.schedule(0, "title Gecikme", "body Gecikme",delay, notificationDetails,payload: "payload gecikme");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();
  }

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
            ElevatedButton(
              child: Text("Bildirim Oluştur"),
              onPressed: (){
                showNotification();
              },
            ),
            ElevatedButton(
              child: Text("Bildirim Oluştur (Gecikmeli)"),
              onPressed: (){
                showDelayedNotification();
              },
            ),
          ],
        ),
      ),
    );
  }
}

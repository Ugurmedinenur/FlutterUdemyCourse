
Future<void> main() async{
  print("Verilerin alınması bekleniyor.");
  var data = await getData();
  print("Veri alınıyor.");
  print("Alınan Veri: $data");
}
Future<String> getData() async{
  for(var i = 0 ; i<= 5; i++){
    Future.delayed(Duration(seconds: i), () => print("Alınan veri miktarı  :${i*20}"));
  }
  return Future.delayed(Duration(seconds: 5), () => "Veri kümesi");
}
import 'Car.dart';

void main(){

  var bmw = Car();

  bmw.color = "Kırmızı";
  bmw.speed = 200;
  bmw.isWork = true;

  print("renk : ${bmw.color}");
  print("hız : ${bmw.speed}");
  print("çalışıyor mu : ${bmw.isWork}");

  bmw.printValues();

  bmw.stop();
  bmw.printValues();

  bmw.work();
  bmw.speedUp(50);
  bmw.printValues();

  bmw.slowDown(30);
  bmw.printValues();

}
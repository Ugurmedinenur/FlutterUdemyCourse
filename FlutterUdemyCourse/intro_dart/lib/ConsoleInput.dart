import 'dart:io';

void main(){

  print("Adınızı giriniz");
  String name = stdin.readLineSync();

  print (name);

  print("yaşınızı giriniz");
  int age = int.parse(stdin.readLineSync());

  print (age);

}
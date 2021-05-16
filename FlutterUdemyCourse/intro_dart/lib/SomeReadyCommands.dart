import 'dart:math';

import 'package:flutter/material.dart';

void main(){

  int min =5;
  int max = 10;

  var r = Random();

  int num = min + r.nextInt((max-min)+1);
  print(num);

  double x = 6.5;

  int c = x.ceil();
  print(c);

  int f = x.floor();
  print(f);

  double s = sqrt(x);
  print(s);

  int y = -10;
  int a = y.abs();
  print(a);


}
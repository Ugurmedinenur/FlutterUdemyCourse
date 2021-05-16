import 'package:flutter/material.dart';
import 'package:null_safety_app/Students.dart';

void main(){
  /*var student = Students();

  student.id = 100;
  student.name = "Mehmet";

  print(student.id);
  print(student.name);*/

  var student = Students(id : 100,name : "Mehmet");

  print(student.id);
  print(student.name);


}
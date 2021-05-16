void main(){

  hello();
  print(hello1());
  hello2("zeynep");

}

void hello(){
  String result = "Hello world";
  print(result);
}
String hello1(){
  String result = "Hello world";
  return result;
}

void hello2(String name){
  String result = "Hello " + name;
  print(result);
}
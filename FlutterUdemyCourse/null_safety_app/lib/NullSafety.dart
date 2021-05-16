void main(){
  String? message = null;

  message = "Hello";

  String? name = null;

  name = "Medine";

  print("Result : ${name?.toUpperCase()}");

  print("Result : ${name!.toUpperCase()}");//risk alıyorum

  if(name != null){
    print("Result : ${name.toUpperCase()}");

  }

}
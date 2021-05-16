void main(){

  var fruits = [];
  fruits.add("Çilek");
  fruits.add("Muz");
  fruits.add("Elma");
  fruits.add("Kivi");
  fruits.add("Kiraz");

  print(fruits);

  fruits[2] = "Ananas";
  print(fruits);

  fruits.insert(3, "portakal");
  print(fruits);

  String str = fruits[0];
  print(str);


}
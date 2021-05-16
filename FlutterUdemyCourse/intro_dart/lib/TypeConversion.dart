void main(){

  int i = 42;
  double d = 42.45;

  int result1 = d.toInt();
  double result2 = i.toDouble();

  print(result1);
  print(result2);

  String str1 = i.toString();
  String str2 = d.toString();

  print(str1);
  print(str2);

  String str = "34";
  String dStr = "34.5";

  int s1 = int.parse(str);
  double s2 = double.parse(dStr);
}
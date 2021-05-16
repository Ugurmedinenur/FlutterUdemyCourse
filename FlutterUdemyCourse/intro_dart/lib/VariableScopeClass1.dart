class VariableScope{
  int x = 10;
  int y = 20;//global

  void sum(){
    int x = 40;//local

    x = x + y;
    print(x);

  }

  void mult(){
    x = x * y;
    print(x);
  }
}
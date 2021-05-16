class Car{
  String color;
  int speed;
  bool isWork;

  void printValues(){
    print("renk : $color");
    print("hız : $speed");
    print("çalışıyor mu : $isWork");
  }

  void work(){
    isWork = true;
    speed = 5;
  }

  void stop(){
    isWork = false;
    speed = 0;
  }

  void speedUp(int speed){
    this.speed += speed;
  }

  void slowDown(int speed){
    this.speed -= speed;
  }
}
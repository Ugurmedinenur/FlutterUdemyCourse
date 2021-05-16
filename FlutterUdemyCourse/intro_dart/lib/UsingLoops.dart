void main(){

  for(var i = 3; i < 6; i++){
    print("a : $i");
  }

  for(var i = 10; i < 21; i += 5){
    print("b : $i");
  }

  for(var i = 20; i>9; i-=2){
    print("c : $i");
  }

  var counter = 1;

  while(counter <4){
    print("while : $counter");
    counter++;
  }

  for(var i = 0; i < 5; i++){
    if(i == 3){
      break;
    }
    print("d : $i");
  }

  for(var i = 0; i < 5; i++){
    if(i == 3){
      continue;
    }
    print("e : $i");
  }

}
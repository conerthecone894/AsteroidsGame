int x = 150;
int y = 150;

spaceship tran = new spaceship();
stars[] bopis = new stars[256];

void setup(){
  size(512, 512);
  
  for(int i = 0; i < bopis.length; i++){
    bopis[i] = new stars();  
  }
  
}

void draw(){
  background(#0f0f1b);
  
  tran.show();
  tran.move();
  tran.countdown();
  
  for(int i = 0; i < bopis.length; i++){
    bopis[i].show();
    bopis[i].drift();
  }
  
  if(keyPressed == true){
    if(key == 'w' || key == 'W')
      tran.accelerate(0.05);
    if(key == 'a' || key == 'A')
      tran.turn(-4);
    if(key == 'd' || key == 'D')
      tran.turn(4);
    if(key == 'p' || key == 'P'){
      tran.hyperspace();
    }
  }
  
}

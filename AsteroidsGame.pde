int x = 150;
int y = 150;

boolean turnLeft = false;
boolean turnRight = false;
boolean accelerate = false;

boolean isAlive = true;

spaceship tran = new spaceship();
stars[] bopis = new stars[256];

ArrayList <asteroid> tomingo  = new ArrayList <asteroid>();

void setup(){
  size(512, 512);
  
  for(int i = 0; i < bopis.length; i++){
    bopis[i] = new stars();  
  }
  
  for(int i = 0; i < 16; i++){
    tomingo.add(new asteroid()); 
  }
  
}

void draw(){
  background(#0f0f1b);
  

  
  //code not specific to anything ^^^^^^
  
  tran.show();
  
  if(isAlive == true){
  tran.move();
  tran.countdown();
  tran.hitbox();
  
  if(turnLeft == true)
    tran.turn(-4);
  if(turnRight == true)
    tran.turn(4);
  if(accelerate == true)
    tran.accelerate(0.05);
    
  } else {
    tran.die();
  }
    
  //spaceship code ^^^^^^
  
  for(int i = 0; i < bopis.length; i++){
    bopis[i].show();
    bopis[i].drift();
  }
  
  //stars code ^^^^^^
  
  for(int i = 0; i < tomingo.size(); i++){
    tomingo.get(i).show();
    tomingo.get(i).move();
    
    float d = dist((float)tran.getX(), (float)tran.getY(), (float)tomingo.get(i).getX(), (float)tomingo.get(i).getY());
    
    if(d <= 15)
      isAlive = false;
    
  }
  
  //asteroids code ^^^^^^
}

void keyPressed(){
  if(key == 'w' || key == 'W')
      accelerate = true;
  if(key == 'a' || key == 'A')
      turnLeft = true;
  if(key == 'd' || key == 'D')
      turnRight = true;
  if(key == 'p' || key == 'P')
      tran.hyperspace();
}

void keyReleased(){
  if(key == 'w' || key == 'W')
      accelerate = false;
  if(key == 'a' || key == 'A')
      turnLeft = false;
  if(key == 'd' || key == 'D')
      turnRight = false;
  if(key == 'p' || key == 'P')
      tran.hyperspace();
}

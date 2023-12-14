int x = 150;
int y = 150;

boolean turnLeft = false;
boolean turnRight = false;
boolean accelerate = false;
boolean shoot = false;

boolean isAlive = true;
boolean runOnce = true;

int bulletCooldown = 0;
int amt = 1;

spaceship tran = new spaceship();
stars[] bopis = new stars[256];
ArrayList <bullet> epic = new ArrayList <bullet>();
ArrayList <asteroid> tomingo  = new ArrayList <asteroid>();
postGame tim = new postGame();

void setup(){
  size(512, 512);
  
  for(int i = 0; i < bopis.length; i++){ //stars
    bopis[i] = new stars();  
  }
  
  for(int i = 0; i < 24; i++){ //asteroids
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
    
    if(d <= 15) //KILLS YOU
      isAlive = false;
    
  }
  
  if(tomingo.size() == 0 && isAlive == true){
    fill(255);
    textSize(15);
    tim.countdown();
  }
  
  //asteroids code ^^^^^^
  
  if(shoot == true && bulletCooldown <= 0){
    epic.add(new bullet(tran));
    bulletCooldown = 24;
  }
  if(bulletCooldown != 0) 
    bulletCooldown--;
                             //adds bullets
 
  for(int i = 0; i < epic.size(); i++){ //controls all bullets
    epic.get(i).move();
    epic.get(i).show();
    
    if(epic.get(i).getX() >= 510 || epic.get(i).getX() <= 2 || epic.get(i).getY() >= 510 || epic.get(i).getY() <= 2){
      epic.remove(i);
      i--;
      break;
    } 
                             //removes bullets when they hit the side of the screen
    
    for(int o = 0; o < tomingo.size(); o++){
      float d = dist((float)epic.get(i).getX(), (float)epic.get(i).getY(), (float)tomingo.get(o).getX(), (float)tomingo.get(o).getY());
      if(d <= 12){
        tomingo.remove(o);
        o--;
        epic.remove(i);
        i--;
        break;
      } 
    }
                             //removes asteroids when shot
  }
 
  //bullet code ^^^^^^
  
  if(tim.isItTime() == true){
    if(runOnce == true){ //sets spaceship starting point for postgame
      tran.postGame();
      runOnce = false;
      
    for(int i = 0; i < 256; i++){
      bopis[i].postGame();
    }
    }

  if(tim.isItTime() == true && isAlive == true){      
      fill(255);
      textSize(12);
      text((int)tim.getScore(), 25, 88);}

     tim.menace(isAlive);
     
     if(tomingo.size() < 1 && tim.getScore()%500 == 0){
       for(int i = 0; i < amt; i++){tomingo.add(new asteroid());}
       tim.addScore(1);
       amt = (int)(Math.random()*4)+1;
     }
     
     float d = dist((float)tran.getX(), (float)tran.getY(), tim.getX(), tim.getY());
     if(d < 30){
       isAlive = false;
       tran.die();
     }
  }
  
  //postgame code ^^^^^^
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
  if(key == 'o' || key == 'O')
      shoot = true;
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
  if(key == 'o' || key == 'O')
      shoot = false;
}

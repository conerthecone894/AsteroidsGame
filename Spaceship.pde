class spaceship extends Floater{
  private int timer;
  
  public spaceship(){ //class constructor
    myCenterX = 256;
    myCenterY = 256;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
    myColor = color(160, 160, 180);
    
    corners = 14;
    xCorners = new int[]{-4, 0, 24, -4, 0, 24, 12, 0, 0, 12, 0, -8, -8, 0};
    yCorners = new int[]{0, 12, 0, 0, -12, 0, 0, 12, -12, 0, 0, 8, -8, 0};
    
    timer = 0;
  }

  public void hitbox(){ //displays ship's hitbox
    noStroke();
    fill(250, 251, 246);
    ellipse((float)myCenterX, (float)myCenterY, 10, 10);
  }

  public void countdown(){ //prevents you from spamming hyperspace
    timer--;
    if(timer <= 0){timer = 0;}
  } 

  public void hyperspace(){ //teleports you to a random spot and sets velocity to 0
    double startX, startY, endX, endY;
    
    if(timer <= 0){
      startX = myCenterX;
      startY = myCenterY;
      
      myCenterX = Math.random()*512;
      myCenterY = Math.random()*512;
      myPointDirection = Math.random()*360;
      
      endX = myCenterX;
      endY = myCenterY;
    
      myXspeed = 0;
      myYspeed = 0;
    
      timer = 88;
      
      stroke(myColor);
      line((float)startX, (float)startY, (float)endX, (float)endY);
    }
  }
  
                                        //what do you think these do?
  public double getX(){return myCenterX;}
  public double getY(){return myCenterY;}
  public double getDirection(){return myPointDirection;}
  
  public void postGame(){
    myCenterX = 256;
    myCenterY = 450;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 270;
  }
  
  public void die(){ //destroys the ship & dispalys "game over" text
    for(int i = 0; i < 14; i++){
      xCorners[i] += (Math.random()*5)-2;
      yCorners[i] += (Math.random()*5)-2;
    }
    
    fill(myColor);
    textSize(32);
    if(tim.isItTime() == false){
      text("you died lmaooooooooooooooooooooo", 45, 100);
    } else {
      text("score: " + (int)tim.getScore(), 45, 100);
    }
  }
  
}

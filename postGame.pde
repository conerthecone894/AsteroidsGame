class postGame{
  private float timer, myX, myY, opacity, score;
  private boolean goTime = false;
  
  public postGame(){
    timer = 320;
    myX = 256;
    myY = 35;
    opacity = 0;
  }
  
  public void countdown(){
    timer--;
    opacity -= 4;
    
    fill(255, 255, 255, opacity);
    rect(0, 0, 512, 512);
                    //the rectangle responsible for that white flash
    
    if(timer >= 0){
      fill(255);
      textSize(12);
      text("oh wow you won", 40, 40);
    }
    if(timer <= 80 && timer >= 0){
      fill(255);
      textSize(50);
      text("BUT ACTUALLY", 53, 88);
    }
                    //text that displays after you win
    
    if(timer == 0){
      opacity = 255;
      goTime = true;
    }
                    //tells the game that postgame has started
   
    if(goTime == true){
      fill(255);
      textSize(12);
      text((int)score, 25, 88);
      score++;
    }
  }
  
  public boolean isItTime(){
    return goTime;
  }
  public float getScore(){
    return (int)score;
  }
                    //get functions
  
  public void end(){
    goTime = false;
  }
  
  public void menace(){
    stroke(2);
    fill(86, 95, 117);
    ellipse(myX, myY, 45, 45);
    line(myX+10, myY-10, myX-10, myY+10);
    line(myX+10, myY+10, myX-10, myY-10);
                    //draws the menace
    
    if(tran.getX() > myX){
      myX += 0.5;
    } else {
      myX -= 0.5;
    }
        if(tran.getY() > myY){
      myY += 0.5;
    } else {
      myY -= 0.5;
    }
                    //moves the meace
  }
  
  
}

class spaceship extends Floater{
  private int timer;
  
  public spaceship(){
    myCenterX = 256;
    myCenterY = 256;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
    myColor = color(250, 251, 246);
    
    corners = 14;
    xCorners = new int[]{-4, 0, 24, -4, 0, 24, 12, 0, 0, 12, 0, -8, -8, 0};
    yCorners = new int[]{0, 12, 0, 0, -12, 0, 0, 12, -12, 0, 0, 8, -8, 0};
    
    timer = 0;
  }

  public void countdown(){
    timer--;
    stroke(255);
    text(timer, 15, 15);
    
    if(timer <= 0)
      timer = 0;
  }

  public void hyperspace(){
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
  
  public void flame(){
    stroke(#fafbf6);
  noFill();
    beginShape();
        curveVertex(x, y+20);
        curveVertex(x, y+20);
        curveVertex(x+4, y+23);
        curveVertex(x+2, y+31);
        curveVertex(x, y+34);
        curveVertex(x, y+34);
      endShape(); //right side of flame
      beginShape();
        curveVertex(x, y+20);
        curveVertex(x, y+20);
        curveVertex(x-4, y+23);
        curveVertex(x-2, y+31);
         curveVertex(x, y+34);
        curveVertex(x, y+34);
      endShape(); //left side of flame
  }
}

class spaceship extends Floater{

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

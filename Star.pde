class stars{
  private float myX, myY, mySpeed;
  
  public stars(){
    myX = (float)(Math.random()*512);
    myY = (float)(Math.random()*512);
    mySpeed = (float)(Math.random()*1);
  } 
  public void show(){ //draws stars
    noStroke();
    fill(#c6b7be);
    ellipse(myX, myY, 3, 3);
  }
  public void drift(){ //makes stars move
    myX += mySpeed;
    if(myX >= 516)
      myX = -4;
  }
}

class stars{
  private float myX, myY, mySpeed, size;
  
  public stars(){
    myX = (float)(Math.random()*512);
    myY = (float)(Math.random()*512);
    mySpeed = (float)(Math.random()*1);
    size = (int)(Math.random()*2)+2;
  } 
  public void show(){ //draws stars
    noStroke();
    fill(#c6b7be);
    ellipse(myX, myY, size, size);
  }
  public void drift(){ //makes stars move
    myX += mySpeed;
    if(myX >= 516)
      myX = -4;
  }
  
  public void postGame(){
    size = (float)Math.random()*2;
  }
}

class asteroid extends Floater{
  private double rotSpeed;
  
  public asteroid(){
    rotSpeed = Math.random()*8;
    myColor = color(86, 95, 117);
    myCenterX = -24;
    myCenterY = -24;
    myXspeed = Math.random()*1.5;
    myYspeed = Math.random()*1.5;
    
    corners = 8;
    xCorners = new int[]{0, 14+(int)(Math.random()*9)-5, 12, 14+(int)(Math.random()*9)-5, 0, -14+(int)(Math.random()*9)-5, -12, -14+(int)(Math.random()*9)-5};
    yCorners = new int[]{12, 14+(int)(Math.random()*9)-5, 0, -14+(int)(Math.random()*9)-5, -12, -14+(int)(Math.random()*9)-5, 0, 14+(int)(Math.random()*9)-5};
  }
  
  public void move(){
    turn(rotSpeed);
    super.move();
  }
  
  public double getX(){return myCenterX;}
  public double getY(){return myCenterY;}
}

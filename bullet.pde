// I need more boolets!
// Hasta la vista, Baby!

class bullet extends Floater{
    private double rotSpeed;
  
  public bullet(spaceship t){
    myCenterX = t.getX();
    myCenterY = t.getY();
    myPointDirection = t.getDirection();
    myColor = color(250, 251, 246);

    rotSpeed = 8;
    
    corners = 4;
    xCorners = new int[]{1, -1, -1, 1};
    yCorners = new int[]{1, 1, -1, -1};
    
    accelerate(4);
  }

  public void move(){
    turn(rotSpeed);
    super.move();
  }

  public double getX(){return myCenterX;}
  public double getY(){return myCenterY;}
}

class Bomb extends Fruit //<>//
{
  //declare variables
  private PImage _bomb;
  private PImage _cloud;
  
  //default constructor
  Bomb()
  {
    super();
    _bomb = loadImage("fruit_ninja_bomb.png");
    _cloud = loadImage ("cloud.png");
  }
  
  public void explode()
  {
  
   if (!super._isSliced)
   {
     image(_bomb, super._x, super._y);
   }
   else
   {
     background(0);
     exit();
   }
  }
  
  void keyPressed()
{
  if ( key == 'c' );
_bomb = _cloud;
}
}
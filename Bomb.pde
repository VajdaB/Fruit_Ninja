class Bomb extends Fruit
{
  //declare variables
  private PImage _bomb;
  
  //default constructor
  Bomb()
  {
    super();
    _bomb = loadImage("fruit_ninja_bomb.png");
  }
  
  //explode when 'touched'
  public void explode()
  {
   if (!super._isSliced)
   {
     image(_bomb, super._x, super._y);
   }
   else
   {
     frameRate(18);
     background(245,15,57);
     exit();
   }
  }
  
}
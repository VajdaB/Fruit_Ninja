class Bomb extends Fruit
{
  //declare variables
  private PImage _bomb;
  
  //default constructor
  Bomb()
  {
    super();
    _bomb = loadImage("fruit_ninja_bomb.jpg");
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
     background(245,15,57);
     exit();
   }
  }
}
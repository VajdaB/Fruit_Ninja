class Bomb extends Fruit
{
  //default constructor
  Bomb()
  {
    super();
    super._img = loadImage("fruit_ninja_bomb.png");
    super._w = super._img.width;
    super._h = super._img.height;
  }
  
  //explode when 'touched'
  public void Update(float x, float y)
  {
   super.Update(x,y);
   if (super._isSliced)
   {
     background(245,15,57);
     exit();
   }
  }
  
}
class Bomb extends Fruit //<>//
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
  public void Update(int x, int y)
  {
    super.Update(x,y);
    super._y = super._y + (int)random(3,7);
    if(super._isSliced)
    {
      background(245,15,57);
      exit();
    }
  }
}
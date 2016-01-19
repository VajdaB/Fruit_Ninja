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
    if (!super._isSliced)
    {
     super.CheckSliced(x, y);
    }

    //making it fall
    super._y = super._y + (int)random(3,6);
    if(super._isSliced)
    {
      background(245,15,67);
      exit();
    }
  }
}
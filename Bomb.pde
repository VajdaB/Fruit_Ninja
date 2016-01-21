class Bomb extends Fruit //<>//
{
  
  //default constructor
  Bomb()
  {
    super();
    super._img = loadImage("fruit_ninja_bomb.png");
    super._w = super._img.width;
    super._h = super._img.height;
    //super._fruitsSliced = loadImage ("brown square.jpg");
  }
  
  //explode when 'touched'
  public void Update(float x, float y)
  {
    super.Update(x,y);
    
    //making it fall
    super._y = super._y + (int)random(3,6);
    if(super._isSliced)
    {
      gameover = true;
      
    }
  }
}
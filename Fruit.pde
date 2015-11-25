class Fruit
{
  private float _x;
  private float _y;
  private float _w;
  private float _h;
  
  private PImage _img;
  private PImage _imgSliced;
  
  private boolean _isSliced;
  private PImage [] _fruits;
  
  Fruit()
  { //<>//
    _fruits = new PImage[4];
    _fruits[0] = loadImage("tomato.png");
    _fruits[1] = loadImage("watermelon.png");
    _fruits[2] = loadImage("lemon.png");
    _fruits[3] = loadImage("coconut.png");
    _img = _fruits[(int)random(4)];
    _imgSliced = loadImage ("watermelonSliced.jpg");
    _x = random(width);
    _y = 0;
    _w = _img.width;
    _h = _img.height;
    _isSliced = false;
  }
 public void Draw()
 {
   if (!_isSliced)
   {
     image ( _img, _x, _y);
   }
   else
   {
     image (_imgSliced, _x, _y);
   }
 }
 
 public void Update(int x, int y)
 {
   //checking to see if point collides with fruit
   if (!_isSliced)
   {
     CheckSliced(x, y);
   }
   
   //making it fall
   _y = _y + (random (2, 7));
   /*if(_y > height)
   {
     Draw(_img = _fruits[(int)random(4)]);
   }*/
 }
 
 private void CheckSliced(int x, int y)
 {
  if (x > _x)
  {
    if (x < _x + _w)
    {
      if (y > _y)
      {
        if (y < _y + _h)
        {
          _isSliced = true;
        }
      }
    }
 }

 }
}
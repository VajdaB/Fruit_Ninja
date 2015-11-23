class Fruit
{
  private float _x;
  private float _y;
  private float _w;
  private float _h;
  
  private PImage _img;
  private PImage _imgSliced;
  
  private boolean _isSliced;
  
  Fruit()
  {
    _img = loadImage ("watermelon.png");
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
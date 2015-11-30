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
  private int _a;
  private PImage [] _fruitsSliced;
  private boolean _areAllFruitsSliced;
  
  Fruit()
  {
    _a = (int)random(5);
    _fruits = new PImage[5];
    _fruitsSliced = new PImage[5];
    _fruits[0] = loadImage("tomato.png");
    _fruits[1] = loadImage("watermelon.png");
    _fruits[2] = loadImage("lemon.png");
    _fruits[3] = loadImage("coconut.png");
    _fruits[4] = loadImage("pineapple.png");
    _img = _fruits[_a];
    _fruitsSliced[0] = loadImage("slicedtomato.png");
    _fruitsSliced[1] = loadImage("slicedwatermelon.png");
    _fruitsSliced[2] = loadImage("slicedlemon.png");
    _fruitsSliced[3] = loadImage("slicedcoconut.png");
    _fruitsSliced[4] = loadImage("slicedpineapple.png");
    _imgSliced = _fruitsSliced[_a];
    _x = random(width);
    _y = 0;
    _w = _img.width;
    _h = _img.height;
    _isSliced = false;
    _areAllFruitsSliced = false;
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
 
 public boolean isSliced()
 {
   return _isSliced;
 }
 
 private void CheckSliced(int x, int y)
 {
  if (scaledX > _x)
  {
    if (scaledX < _x + _w)
    {
      if (scaledY > _y)
      {
        if (scaledY < _y + _h)
        {
          _isSliced = true;
        }
      }
    }
 }

 }
}
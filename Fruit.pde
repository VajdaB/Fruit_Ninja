class Fruit  //<>// //<>//
{
  private PImage watermelonIMG;
  private PImage tomatoIMG; //<>//
  private PImage pineappleIMG;
  private PImage lemonIMG; 
  private PImage coconutIMG;
  private PImage watermelonSlicedIMG;

  private float _x;
  private float _y;
  private float _w;
  private float _h;

  private PImage _img;
  private PImage _imgSliced;

  private boolean _isSliced;
  private PImage _fruits;
  private int _a; //<>//
  private PImage _fruitsSliced;
  private PImage [] _fruitss;
  private PImage[] _fruitssliced;
  
  Fruit() 
  { 
    _fruits = loadImage("brown square.jpg");
    _fruitsSliced = loadImage("brown square.jpg");
    _img = _fruits;
    _imgSliced = _fruitsSliced;
    _x = random(width);
    _y = 0;
    _w = 0;
    _h = 0;
    _isSliced = false;
  }

  Fruit(int ab) 
  { 
    _a = (int)random(ab);
    _fruitss = new PImage[ab];
    _fruitssliced = new PImage[ab];
    _fruitss[0] = loadImage("tomato.png");
    _fruitss[1] = loadImage("watermelon.png");
    _fruitss[2] = loadImage("lemon.png");
    _fruitss[3] = loadImage("coconut.png");
    _fruitss[4] = loadImage("pineapple.png");
    _img = _fruitss[_a]; //<>//
    _fruitssliced[0] = loadImage("slicedtomato.png"); //<>//
    _fruitssliced[1] = loadImage("slicedwatermelon.png");
    _fruitssliced[2] = loadImage("slicedlemon.png");
    _fruitssliced[3] = loadImage("slicedcoconut.png");
    _fruitssliced[4] = loadImage("slicedpineapple.png");
    _imgSliced = _fruitssliced[_a];
    _x = random(width);
    _y = 0;
    _w = _img.width;
    _h = _img.height; //<>//
    _isSliced = false;
  }
  public void Draw()
  {
    if (!_isSliced)
    {
      image ( _img, _x, _y);
    } else
    {
      image (_imgSliced, _x, _y); //<>//
    }
  }

  public float getYPos()
  {
    return _y;
  }

  public void Update(float x, float y)
  {
    //checking to see if point collides with fruit
    if (!_isSliced)
    {
      CheckSliced(x, y);
    }

    //making it fall //<>//
    _y = _y + (random (3, 6));
  }

  public boolean isSliced()
  {
    return _isSliced;
  }
 
 private void CheckSliced(float x, float y)
 {
  if (x > _x)
  {
    if (x < _x + _w)
    {
      if (y > _y)
      {      
        if (y < _y + _h)
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
}
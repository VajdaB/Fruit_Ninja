/* Fruit Ninja style Kinect game

by Bette and Krithika

*/

PImage watermelonIMG;
PImage tomatoIMG;
PImage pineappleIMG;
PImage lemonIMG; //<>//
PImage coconutIMG;
PImage backgroundIMG;
PImage watermelonSlicedIMG;

Fruit fruit;

//declare global variables

void setup()
{
  background (0);
  size (1000, 700);
  fruit = new Fruit();
  /* watermelonIMG = loadImage ("watermelon.png");
  lemonIMG = loadImage ("lemon.png");
  pineappleIMG = loadImage ("pineapple.png");
  coconutIMG = loadImage ("coconut.png");
  tomatoIMG = loadImage ("tomato.png");
  backgroundIMG = loadImage ("background.jpg");
  watermelonSlicedIMG = loadImage ("watermelonSliced.jpg"); */
}

void draw()
{
  background(0);
  fruit.Update(mouseX, mouseY);
  fruit.Draw();
}
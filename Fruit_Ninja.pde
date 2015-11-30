/* Fruit Ninja style Kinect game

by Bette and Krithika

*/

PImage watermelonIMG;
PImage tomatoIMG;
PImage pineappleIMG;
PImage lemonIMG;  //<>//
PImage coconutIMG;
PImage backgroundIMG;
PImage img;
PImage watermelonSlicedIMG;

Fruit[] fruit;
Bomb bomb;
//declare global variables
int numberOfFruits;
void setup()
{
  img = loadImage ("background.jpg");
  background(img);
  size (1000, 700);
  numberOfFruits = (int)random(4);
  fruit = new Fruit[numberOfFruits];
  bomb = new Bomb();
  for(int i = 0; i<numberOfFruits; i++)
  {
    fruit[i] = new Fruit();
  }
}

void draw()
{
  background(img);
  for(int i = 0; i < numberOfFruits;i++)
  {
    fruit[i].Update(mouseX, mouseY);
    fruit[i].Draw();
    if (fruit[i].isSliced() == true)
    {
      fruit[i] = new Fruit();
      fruit[i].Update(mouseX, mouseY);
      fruit[i].Draw();
    }
  }
  bomb.Update(mouseX, mouseY);
  bomb.explode();
}
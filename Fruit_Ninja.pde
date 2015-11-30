/* Fruit Ninja style Kinect game

by Bette and Krithika

*/

PImage watermelonIMG;
PImage tomatoIMG;
PImage pineappleIMG;
PImage lemonIMG; //<>// //<>// //<>//
PImage coconutIMG;
PImage backgroundIMG;
PImage watermelonSlicedIMG;

Fruit[] fruit;
Fruit[] newFruit;
Bomb bomb;
Bomb[] newBomb;
//declare global variables
int numberOfFruits;
void setup()
{
  background (0);
  size (1000, 700);
  numberOfFruits = (int)random(4);
  fruit = new Fruit[numberOfFruits];
  newFruit = new Fruit[1];
  bomb = new Bomb();
  for(int i = 0; i<numberOfFruits; i++)
  {
    fruit[i] = new Fruit();
  }
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
  for(int i = 0; i < numberOfFruits;i++)
  {
    fruit[i].Update(mouseX, mouseY);
    fruit[i].Draw();
    
  }
  for(int i = 0; i< numberOfFruits; i++)
  {
    if (fruit[i].isSliced() == true)
    {
      Fruit newFruit;
      newFruit = new Fruit();
      newFruit.Update(mouseX, mouseY);
      newFruit.Draw(); 
    }
  }
  for(int i = 0; i< numberOfFruits; i++)
  {
    if (fruit[i].isSliced() == true)
    {
      Fruit newFruit;
      newFruit = new Fruit();
      newFruit.Update(mouseX, mouseY);
      newFruit.Draw(); 
    }
  }
  bomb.Update(mouseX, mouseY);
  bomb.explode();
}
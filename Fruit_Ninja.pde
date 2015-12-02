/* Fruit Ninja style Kinect game

by Bette and Krithika

*/


Fruit[] notSliced;
Fruit[] sliced;
Bomb bomb; //<>//
Bomb[] newBomb;

//declare global variables
int numberOfFruits;
void setup()
{
  frameRate(10);
  background (0);
  size (1000, 700);
  numberOfFruits = (int)random(4);
  notSliced = new Fruit[numberOfFruits];
  sliced = new Fruit[numberOfFruits*2];
  bomb = new Bomb();
  for(int i = 0; i<numberOfFruits; i++)
  {
    notSliced[i] = new Fruit(4);
    sliced[i] = new Fruit();
  }
}

void draw()
{
  background(0);
  for(int i = 0; i < numberOfFruits;i++)
  {
    notSliced[i].Update(mouseX, mouseY);
    notSliced[i].Draw();
    if (notSliced[i].isSliced() == true)
    {
      sliced[i] = null;
      sliced[i] = notSliced[i];
      notSliced[i] = null;
      notSliced[i] = new Fruit(4);
    }
    sliced[i].Update(mouseX, mouseY);
    sliced[i].Draw(); 
    notSliced[i].Update(mouseX, mouseY);
  }
  //bomb.Update(mouseX, mouseY);
  //bomb.explode();
}
/*   //<>//

Fruit Ninja-style Kinect game

by Bette and Krithika

Kinect code and Kinect Tracker adapted from Daniel Shiffman

*/
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

KinectTracker tracker;
Kinect kinect;

PImage watermelonIMG;
PImage tomatoIMG;
PImage pineappleIMG;
PImage lemonIMG;  //<>//
PImage coconutIMG;
PImage backgroundIMG;
PImage watermelonSlicedIMG;
PImage knifeIMG;

float scaledX;
float scaledY;

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
  knifeIMG = loadImage ("knife.png");
  numberOfFruits = (int)random(4);
  fruit = new Fruit[numberOfFruits];
  newFruit = new Fruit[1];
  bomb = new Bomb();
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  for(int i = 0; i<numberOfFruits; i++)
  {
    fruit[i] = new Fruit();
  }
}

void draw()
{
  background(0);
  noCursor();
  image (knifeIMG, scaledX, scaledY);
  for(int i = 0; i < numberOfFruits;i++)
  {
    fruit[i].Update(scaledX, scaledY);
    fruit[i].Draw();
    
  }
  for(int i = 0; i< numberOfFruits; i++)
  {
    if (fruit[i].isSliced() == true)
    {
      Fruit newFruit;
      newFruit = new Fruit();
      newFruit.Update(scaledX, scaledY);
      newFruit.Draw(); 
    }
  }
  for(int i = 0; i< numberOfFruits; i++)
  {
    if (fruit[i].isSliced() == true)
    {
      Fruit newFruit;
      newFruit = new Fruit();
      newFruit.Update(scaledX, scaledY);
      newFruit.Draw(); 
    }
  }
  bomb.Update(scaledX, scaledY);
  bomb.explode();
  // Run the tracking analysis
  tracker.track();
  // Show the image
  //tracker.display();

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();

  // Display some info
  int t = tracker.getThreshold();
  fill(0);
    
  // Scaled the lerped position 
  scaledX = map(v2.x, 0, kinect.width, 0, width);
  scaledY = map(v2.y, 0, kinect.height, 0, height);
    
  println(kinect.width + "x" + kinect.height);
  println(width + "x" + height);
  fill(10,255,95);
  ellipse (scaledX, scaledY, 40, 40);
}
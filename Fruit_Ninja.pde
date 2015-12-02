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

<<<<<<< HEAD
=======
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
>>>>>>> origin/master

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
  knifeIMG = loadImage ("knife.png");
  numberOfFruits = (int)random(4);
  notSliced = new Fruit[numberOfFruits];
  sliced = new Fruit[numberOfFruits*2];
  bomb = new Bomb();
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  for(int i = 0; i<numberOfFruits; i++)
  {
    notSliced[i] = new Fruit(4);
    sliced[i] = new Fruit();
  }
}

void draw()
{
  background(0);
  noCursor();
  image (knifeIMG, scaledX, scaledY);
  for(int i = 0; i < numberOfFruits;i++)
  {
<<<<<<< HEAD
    notSliced[i].Update(mouseX, mouseY);
    notSliced[i].Draw();
    if (notSliced[i].isSliced() == true)
    {
      sliced[i] = null;
      sliced[i] = notSliced[i];
      notSliced[i] = null;
      notSliced[i] = new Fruit(4);
=======
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
>>>>>>> origin/master
    }
    sliced[i].Update(mouseX, mouseY);
    sliced[i].Draw(); 
    notSliced[i].Update(mouseX, mouseY);
  }
<<<<<<< HEAD
  //bomb.Update(mouseX, mouseY);
  //bomb.explode();
=======
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
>>>>>>> origin/master
}
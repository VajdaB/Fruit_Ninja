/* //<>// //<>//
Fruit Ninja-style Kinect game

by Bette and Krithika

This code allows a user to play Fruit Ninja with their hand as the slicer. 
Kinect code and Kinect Tracker codes adapted from Daniel Shiffman.

*/

//Kinect Libraries for mac version
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*; //<>//
import org.openkinect.processing.*;
import org.openkinect.tests.*;

//The minim library used for sound
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*; //<>//
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

KinectTracker tracker;
Kinect kinect;

//Images used
PImage backgroundIMG; //<>//
PImage knifeIMG; //<>//

AudioPlayer player;
Minim minim; //<>// //<>//

float scaledX;
float scaledY;

//Instantiating the classes made
Fruit[] notSliced;
Fruit[] sliced;
Bomb[] bomb; //<>//

//declare global variables
int numberOfFruits;
int numberOfBombs;

void setup()
{
  frameRate(10);
  background (0);
  size (1000, 700);
  knifeIMG = loadImage ("knife.png");
  numberOfFruits = (int)random(3,8);
  notSliced = new Fruit[numberOfFruits];
  sliced = new Fruit[90];

  kinect = new Kinect(this);
  tracker = new KinectTracker();
  bomb = new Bomb();
  
  for(int i = 0; i<numberOfFruits; i++)
  {
    notSliced[i] = new Fruit(4);
  }

  for(int i = 0; i<90;i ++)
  {
    sliced[i] = new Fruit();
  }
  minim = new Minim(this);
  player = minim.loadFile("Fruit Ninja.mp3");
  player.play();
  
  //determine how many bombs fall
  numberOfBombs = (int)random(3,5);
  bomb = new Bomb[numberOfBombs];
  for(int i = 0; i<numberOfBombs; i++)
  {
    bomb[i] = new Bomb();
  } 
}

void draw()
{
  tracker.track();
  // Show the image
  tracker.display();
  
  PImage background;
  background = loadImage("background.jpg");
  background(background);
  
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();

  scaledX = map(v2.x, 0, kinect.width, 0, width);
  scaledY = map(v2.y, 0, kinect.height, 0, height);

  background(0);
  noCursor();
  
  image (knifeIMG, scaledX, scaledY);
  
  //Make fruits fall and get sliced
  for(int i = 0; i < numberOfFruits;i++)
  {
    notSliced[i].Update(scaledX, scaledY);
    notSliced[i].Draw();
    
    //switch a fruit to the sliced array if a not sliced fruit is sliced.
    if (notSliced[i].isSliced() == true)
    {
      for(int j = 0; j <numberOfFruits*2; j++)
      {
        if(sliced[j] == null)
        {
          sliced[j] = notSliced[i];
          notSliced[i] = null;
          notSliced[i] = new Fruit(4);
        }
      }
    }
    
    //draw and update the sliced and not sliced fruits
    notSliced[i].Update(scaledX, scaledY);
    notSliced[i].Draw();
    sliced[i].Update(scaledX, scaledY);
    sliced[i].Draw();
    
    //Update position when fruits reach bottom of screen
    if(sliced[i].getYPos() > height)
    {
      sliced[i] = new Fruit();
    }
    if(notSliced[i].getYPos() > height)
    {
      notSliced[i] = new Fruit(4);
    }
  }
  //Draw and update the bomb
  for(int i = 0; i<numberOfBombs; i++)
  {
    bomb[i].Draw();
    bomb[i].Update(scaledX, scaledY);
    if(bomb[i].getYPos() > height) bomb[i] = new Bomb();
  }
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
  fill(10,255,95); //<>//
}

 //<>//
void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
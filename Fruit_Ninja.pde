/* //<>//

Fruit Ninja-style Kinect game

by Bette and Krithika

This code allows a user to play Fruit Ninja with their hand as the slicer. 
Kinect code and Kinect Tracker codes adapted from Daniel Shiffman.

*/

import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*; //<>//
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

KinectTracker tracker;
Kinect kinect;

AudioPlayer player;
Minim minim; //<>//

PImage backgroundIMG;
PImage knifeIMG;

float scaledX;
float scaledY;

Fruit[] notSliced;
Fruit[] sliced;
Bomb bomb; 

//declare global variables
int numberOfFruits;
void setup()
{
  frameRate(10);
  background (0);
  size (1000, 700);
  knifeIMG = loadImage ("knife.png");
  numberOfFruits = (int)random(4,8);
  notSliced = new Fruit[numberOfFruits];
  sliced = new Fruit[90];
  bomb = new Bomb();
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  for(int i = 0; i<numberOfFruits; i++)
  {
    notSliced[i] = new Fruit(5);
  }
  for(int i = 0; i<90;i ++)
  {
    sliced[i] = new Fruit();
  }
  minim = new Minim(this);
  player = minim.loadFile("Fruit Ninja.mp3");
  player.play();
}

void draw()
{
  background(0);
  noCursor();
  image (knifeIMG, scaledX, scaledY);
  for(int i = 0; i < numberOfFruits;i++)
  {
    notSliced[i].Update(mouseX, mouseY);
    notSliced[i].Draw();
    if (notSliced[i].isSliced() == true)
    {
      for(int j = 0; j <numberOfFruits*2; j++)
      {
        if(sliced[j] == null)
        {
          sliced[j] = notSliced[i];
          notSliced[i] = null;
          notSliced[i] = new Fruit(5);
        }
      }
    }

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
      notSliced[i] = new Fruit(5);
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
    
  fill(10,255,95);
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
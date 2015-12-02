// Daniel Shiffman
// Tracking the average location beyond a given depth threshold
// Thanks to Dan O'Sullivan

// v2 has x and y co-ordinates of where the (average position) point is

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;


void setup()
{
  kinect = new Kinect(this);
  tracker = new KinectTracker();
}

void draw() {
  background(0);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();

  // Display some info
  int t = tracker.getThreshold();
  fill(0);
  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " + 
    "UP increase threshold, DOWN decrease threshold", 10, 500);
    
    float scaledX = map(v2.x, 0, kinect.width, 0, width);
    float scaledY = map(v2.y, 0, kinect.height, 0, height);
    
  println(kinect.width + "x" + kinect.height);
   ellipse (scaledX, scaledY, 40, 40);
}
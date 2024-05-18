import processing.video.*;
import oscP5.*;
import netP5.*;

Capture video;

// OSC receive
OscP5 oscP5;
NetAddress myRemoteLocation;

int canvasWidth = 720;
int canvasHeight = 480;
int w = 1; // have to be identical to minW
int offset = 0;
int normalShotWidth = 200;
int normalShotHeight = 160;
int numOfColumns = canvasWidth / normalShotWidth;
int numOfRows = canvasHeight / normalShotHeight;

float high, low;

void setup() {
  size(720, 480);
  video = new Capture(this);
  video.start();
  
   // Initialize an instance listening to port 12000
  oscP5 = new OscP5(this,12001);
  myRemoteLocation = new NetAddress("127.0.0.1", 12001);
}

void captureEvent(Capture video) {
  video.read();
}  

void draw() {
  frameRate(10);
  framerate();
  
  // singular image      
  int transparent = floor(map(low, 0, 0.1, 100., 256.));
  int r = floor(map(high, 0, 0.1, 0., 255.));
  int g = floor(map(low, 0, 0.1, 0., 255.));
  int b = floor(map(low, 0, 0.001, 0., 255.));

  int x = (offset % numOfColumns) * normalShotWidth;
  int y = floor(map(offset % (numOfColumns * numOfRows), 0, numOfColumns * numOfRows, 0, numOfRows)) * normalShotHeight;

  // COLOR THE SQUARE WHEN BEAT IS TRIGGERED
  // BEAT HAPPENS WHEN IT PASSES xxx THRESHOLD
  if (low > 0.005) {
      tint(r, g, b, transparent);
  }
  else {
      tint(255, transparent);
  }
  
  //if (offset % highRate == 0) {
   image(video, x, y, normalShotWidth, height / 3);
  //}

       
  offset++;
    
  // Save Frame
  //if (offset % (numOfColumns * numOfRows) == 0) {
  //  saveFrame("rec-####.png");
  //}
}

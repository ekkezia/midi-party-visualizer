import processing.video.*;
import oscP5.*;
import netP5.*;

Capture video;

// OSC receive
OscP5 oscP5;
NetAddress myRemoteLocation;

int x = 0;
int w = 1; // have to be identical to minW
int normalShotWidth = 200;
int normalShotHeight = 160;
PImage[] slices;
int sliceIndex = 0;
int offset = 0;

float highThreshold = 0.2;
float lowThreshold = 0.004;

void setup() {
  size(720, 480);
  video = new Capture(this);
  video.start();
  
  // Initialize an instance listening to port 12000
  oscP5 = new OscP5(this,12001);
  myRemoteLocation = new NetAddress("127.0.0.1", 12001);

  slices = new PImage[width / w];
  for (int i = 0; i < slices.length; i++) {
    slices[i] = createImage(w, height, RGB);
  }
}

void getImage() {
  video.read();
}  

void draw() {
  getImage();
  //background(0);
  slices[sliceIndex].copy(video, width/2 - w/2, 0, w, height, 0, 0, w, height);
  for (int i = 0; i < slices.length; i++) {
     int index = (i + offset) % slices.length;
     
     // Capping the values
     // Set the framerate
     framerate();
     // Set the width
     width();
     
     int transparent = floor(map(high, 0, 0.1, 100., 256.));
     tint(255, transparent);  // Apply transparency without changing color
     
     // HIGH PASS
     //if (offset % highRate == 0) {
       image(slices[index], i*wHigh, height / 3 * 0, wHigh, height / 3);
     //}
     
     // MID PASS: NORMAL SLITSCAN
     tint(255, 256);
     // mid pass / normal slitscan
     image(slices[index], i*w, height / 3 * 1, w, height / 3);
        
     
     // LOW PASS 
     transparent = floor(map(low, 0, 0.1, 100., 256.));
     tint(255, transparent);  // Apply transparency without changing color;
     //if (offset % lowRate == 0) {
       image(slices[index], i*wLow, height / 3 * 2, wLow, height / 3);
     //}
  }
       
  sliceIndex = (sliceIndex + 1) % slices.length;
  offset++;
  
  // Info Text
  textSize(16);
  text("HI %high", 16, height / 3 * 0 + normalShotHeight / 2);
  text("LO %low", 16, height / 3 * 2 + normalShotHeight / 2);
  
  // Save Frame
  //if (sliceIndex == 0) {
  //  saveFrame("rec-####.png");
  //}
}

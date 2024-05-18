import processing.video.*;
import oscP5.*;
import netP5.*;

Capture video;
PImage bgImage;

// OSC receive
OscP5 oscP5;
NetAddress myRemoteLocation;

int startFrom = 0; // latest rec file no 'rec-###.jpg'
int savedFrames = 0;
int index = 0;

int minMidi = 36;
int maxMidi = 83;
int range = maxMidi - minMidi;
int noOfMidi = 12; // default no of midi is 24, but it is too many for us
String[] musicScale = {"C", "C#","D","D#","E","F","F#","G","G#","A","A#","B","C"};

int canvasHeight = 600;
int canvasWidth = canvasHeight * 3/2;
int rowHeight = floor(canvasHeight/noOfMidi);
int colWidth = floor(canvasWidth/4);
int shotHeight = rowHeight;
int shotWidth = shotHeight * 3/2;
int numOfColumns = 4;
int numOfRows;
int shotsPerFrame; 

void setup() {
  size(900, 600);
  
  // Initialize an instance listening to port 12000
  oscP5 = new OscP5(this,12001);
  myRemoteLocation = new NetAddress("127.0.0.1", 12001);

  video = new Capture(this, 600, 400);
  video.start();
  
  numOfColumns = width / colWidth;
  numOfRows = height / rowHeight;
  shotsPerFrame = (width / shotWidth) + 1; // add 1 column to give space for clean up
  
  // Background Image
  bgImage = loadImage("moonwalk.jpg");
  bgImage.resize(width, height);
  
  // Draw MIDI Background
  drawMIDIBackground();
}

void getImage() {
  video.read();
  index++;
}  

void draw() {
  frameRate(2); // todo?: follow dj bpm
  getImage();

  // Show images
  int x = ((index - 1) % shotsPerFrame) * shotWidth;

  if (index > 1) {
     // Alter image if it is loud enough, to indicate the "accented beat"
    //if (mappedAmp < 90) {
      //fill(0);
      //rect(x, pitchY, shotWidth, shotHeight);
      //filter(BLUR, 6);
    //}
    image(video, x, pitchY, shotWidth, shotHeight);
  }
  
  // Clean up canvas when reaching the end of width
  if ((frameCount) % shotsPerFrame == 0) {
    // Save Frame
    //saveFrame("recs/rec-######.png");
    savedFrames += 1;
    
    // Redraw background
    drawMIDIBackground();
  }
}

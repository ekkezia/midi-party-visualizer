// This value is set by the OSC event handler
// This value is set by the OSC event handler
float amplitude = 0;
// Declare a scaling factor
float scale=6;
// Declare a smooth factor
float smooth_factor=0.1;

int pitchY = 0;
int mappedAmp;

void oscEvent(OscMessage theOscMessage) {
    float value = theOscMessage.get(0).floatValue();
    
    if (theOscMessage.checkAddrPattern("/amp")) {
      mappedAmp = floor(map(value, 0, 1, 0, 100));
    }
    
    if (theOscMessage.checkAddrPattern("/pitch")) {     
      pitchY = ((floor(value) - minMidi) % (noOfMidi)) * rowHeight;
    }
}

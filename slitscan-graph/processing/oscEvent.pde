float high, low;

void oscEvent(OscMessage theOscMessage) {
    float value = theOscMessage.get(0).floatValue();
    
    if (theOscMessage.checkAddrPattern("/high")) {
      high = value;
    }
    
    if (theOscMessage.checkAddrPattern("/low")) {
      low = value;      
    }
}

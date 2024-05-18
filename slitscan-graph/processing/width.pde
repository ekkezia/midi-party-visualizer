// optional. 
// a bit too distracting
int wHigh, wMid, wLow = 1;
int minW = 1;
int maxW = 10;

void width() {
     // Width High
     if (high >= highThreshold) {
       wHigh = maxW;
     } else if(high <= 0) {
       wHigh = minW;
     } else {
       wHigh = floor(map(high, 0, highThreshold, minW, maxW));
     }
     
     // Width Low
     if (low >= lowThreshold) {
       wLow = maxW;
     } else if(low <= 0) {
       wLow = minW;
     } 
     else {
       wLow = floor(map(low, 0, lowThreshold, maxW, minW));
     }
}

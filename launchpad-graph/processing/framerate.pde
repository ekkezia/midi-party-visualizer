float highThreshold = 0.2;
float lowThreshold = 0.004;
int highRate = 20;
int lowRate = 20;
int maxRate = 20;
int minRate = 1;

void framerate() {
       // Rate
     // make the speed move in the same BPM/Amplitude as the song?
     // so if the dancer moves with the same speed, it will form the shape clearer
     if (high >= highThreshold) {
       highRate = maxRate;
     } else if(high <= 0) {
       highRate = minRate;
     } else {
       highRate = floor(map(high, 0, highThreshold, minRate, maxRate));
     }
     
     if (low >= lowThreshold) {
      lowRate = maxRate;
     } else if(low <= 0) {
       lowRate = minRate;
     } else {
       lowRate = floor(map(low, 0, lowThreshold, minRate, maxRate));
     }
}

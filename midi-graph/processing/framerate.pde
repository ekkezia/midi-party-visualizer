void framerate() {
     // Capping the values
     // Rate
     // make the speed move in the same BPM/Amplitude as the song?
     // so if the dancer moves with the same speed, it will form the shape clearer
     if (high >= highThreshold) {
       rate = minRate;
     } else if(high <= 0) {
       rate = maxRate;
     } else {
       rate = floor(map(high, 0, highThreshold, maxRate, minRate));
     }
}
void drawMIDIBackground() {
  background(bgImage); // todo: change with environment bg
  
  // columns
  for (int i = 0; i < numOfColumns; i++) {
    stroke(255);
    line(i * colWidth, 0, i * colWidth, height);
    
    // Measure Label
    fill(255);
    textSize(16);
    text(startFrom + (i + (savedFrames * numOfColumns)), (colWidth * i),  height/2); // graphic score marker
  }
  // rows
  for (int j = 0; j < numOfRows; j++) {
    stroke(255);
    line(0, j * rowHeight, width, j * rowHeight);
    
    // Pitch Label
    fill(255);
    textSize(16);
    text(musicScale[j], 0, (rowHeight * j) + (rowHeight/2)); // graphic score marker
  }
}

void startDrawing () {
  int index = 0;
  background(background);
  
  // Theese are put here, because repeating them in for loop would be meaningless (This is more optimized)
  textSize(fontSize);
  textFont(createFont(textFont, 18));
  fill(white);
  if (!strokes) {
    noStroke();
  }
  rectMode(CORNER);
  
  for (int i = 0; i < groups.length; i++) {
    float xOffset = i % 2 == 0 ? width/2 - 425 : width/2 + 25;
    float yOffset = i < 2 ? height/2 - 195 : height/2 + 30;
    
    //Create headers for the groups (A, B, C, D)
    Header[i] = new Headers(xOffset, yOffset, i);
    
    for (int j = 0; j < groups[i].length; j++) {
      float x = xOffset;
      float y = yOffset + j * boxSpaceing;
      
      // Loads the flags if they are not loaded.
      if (index < flags.length && flags[index] == null)  {
        String filename = "Flags/" +groups[i][j] + ".png";
        flags[index] = loadImage("Flags/" +groups[i][j] + ".png");
        println("Loading image: " + filename + " -> " + (flags[index] != null ? "Success" : "Failed"));
        index++;
      }
      
       int Index = i * 4 + j;
       Countries[Index] = new Country(x, y, i, j, flags[Index], groups[i][j]);
       Countries[Index].display();
    }
  }
  
  
  //Middle stripe in the center of the screen
  fill(white);
  rectMode(CENTER);
  rect(width/2, height/2, 4, height);
}

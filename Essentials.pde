void loadEssentials() {
  //Music whenever klicking DK flag & boo when klick on any other flag:
  sound = new SoundFile(this, "DenmarkSong.mp3");
  boo = new SoundFile(this, "boo.mp3");
  sound.jump(3.5);
  sound.pause();
  
  //Create the falling flags above the canvas, so whenever klicked they are displayed and gliding down the screen.
  for (int i = 0; i < amountOfFallingFlags; i++) {
    float randomX = random(70, width - 70);
    rainingFlags[i] = new RainingFlag(randomX, 0);
  }
  
  //Start the drawing.
  startDrawing();
}

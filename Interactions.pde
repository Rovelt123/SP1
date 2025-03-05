void draw () {
  for (int i = 0; i < 16; i++) {
    if (Countries[i].isMouseOver()) {
      pressOnFlag(Countries[i].name, Countries[i].img);
      overFlag = true;
      break;
    } else {
      overFlag = false;
    }
  }

  // Must be out from the for loop, otherwise the cursor would be flickering.
  if (overFlag == true) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }

  if (isRainingFlags) {
    startDrawing();
    for (int i = 0; i < amountOfFallingFlags; i++) {
      rainingFlags[i].fall();
      rainingFlags[i].display();
    }
  } else {
    startDrawing();
  }
  
}

// INTERACTIONS
void pressOnFlag (String flagName, PImage flag) {
  if (mousePressed) {
    if (millis() >= timeoutCounter+250) {
      timeoutCounter = millis();
      if (!soundActive) {
        soundActive = true;
        if (flagName.equals("DENMARK")) {
          sound.play();
          sound.amp(volume);
          isRainingFlags = true;
          denmarkImage = flag;
        } else {
          boo.play();
          boo.amp(volume);
        }
      } else {
        soundActive = false;
        if (boo.isPlaying()) {
          boo.pause();
        } else if (sound.isPlaying()) {
          isRainingFlags = false;
          //startRainingFlags();
          sound.pause();
        }
      }
    }
  }
  if (!sound.isPlaying() && soundActive) {
    if (!multipleSoundsAtOnce) {
      timeoutCounter = millis()+ 4000;
    }
    soundActive = false;
  }
}

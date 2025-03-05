//Imports of libraries
import processing.sound.*;
SoundFile sound;
SoundFile boo;

// STRINGS
String [] nameOfFlags = new String[16];

// BOOLEANS
boolean soundActive = false;
boolean overFlag = false;
boolean isRainingFlags = false;

// FLOATS
float [] flagX = new float[16];
float [] flagY = new float[16];

// INTS
int timeoutCounter; //If I don't have a counter on, it won't work probably unless you click really fast.

// FONT & IMAGES
PImage[] flags = new PImage[16];
PFont font;
PImage denmarkImage;

//Classes
RainingFlag[] rainingFlags = new RainingFlag[amountOfFallingFlags];
Country []Countries = new Country[16];
Headers []Header = new Headers[4];

void setup() {
  size(900, 500); // No matter the height or width the spacing and placement will be the same and the center of the screen, but size must not be lower than 900x500!!!
  loadEssentials();
}

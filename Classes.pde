import processing.sound.*;

class Country {
  float x;
  float y;
  int index;
  int jIndex;
  PImage img;
  String name;
  Country(float tmpx, float tmpy, int tmpIndex, int tmpJIndex, PImage tmpImg, String tmpName) {
    this.x = tmpx;
    this.y = tmpy;
    this.index = tmpIndex;
    this.jIndex = tmpJIndex;
    this.img = tmpImg;
    this.name = tmpName;
  }

  void display() {
    textAlign(LEFT, CENTER);
    int Color = this.index < groups.length / 2 ? yellow : lightBlue;
    fill(white);
    rect(x, y, 400, 40);
    fill(Color);
    rect(x+ 390, y, 10, 40);

    //Shadows behind flags
    for (int i = 70; i > 0; i--) {
      fill(0, 0, 0, 100-i*3);
      rect (x+60+i, y, 2, 40, 5);
    }
    //Draw images
    image(this.img, x, y, 70, 40);
    fill(black);
    text(groups[this.index][this.jIndex], this.x + 100, this.y + 20);
  }

  boolean isMouseOver() {
    boolean isTrue = false;
    if (mouseX >= this.x && mouseX <= this.x + 70 && mouseY >= this.y && mouseY <= this.y + 40) {
      isTrue = true;
    }
    return isTrue;
  }
}

class Headers {
  float x;
  float y;
  int index;
  Headers(float tmpx, float tmpy, int tmpIndex){
    this.x = tmpx;
    this.y = tmpy;
    this.index = tmpIndex;
    textAlign(CENTER, CENTER); 
    int Color = tmpIndex < groups.length / 2 ? yellow : lightBlue;
    fill(Color);
    text("GROUP " + char('A' + tmpIndex), tmpx + 200, tmpy- 20);
  }  
}



class RainingFlag {
  float x, y;
  float speed;
  float wave;
  RainingFlag(float x, float y) {
    this.x = x;
    this.y = random(-500, y);
    this.speed = 1;
    this.wave = random(0, 6);
  }
  void fall() {
    if (y < height) {
      y += speed;
      x += sin(wave)*random(2, 3);

      // Øg offset, så bevægelsen udvikler sig glidende
      this.wave += random(0.03, 0.05);
    } else {
      y = 0;
      x = random(0, width-70);
    }
  }
  void display() {
    image(denmarkImage, x, y, 70, 40);
  }
}

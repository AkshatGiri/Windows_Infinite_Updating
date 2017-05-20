//Press P to pause the percentage
//

int x = 0;
boolean pause = false;
Animation loadingAnim;


void setup() {
  surface.setAlwaysOnTop(true);
  fullScreen();
  background(0, 119, 215);
  frameRate(24);
  //Font and Text stuff
  PFont font;
  font = loadFont("SegoeUI-Semilight-48.vlw");
  textFont(font);
  textSize(25);
  textAlign(CENTER);
  //Animation stuff
  loadingAnim = new Animation("loading2/Loading animation", 105);
  imageMode(CENTER);
}


void draw() {
  background(0, 119, 215);
  //Animation
  loadingAnim.display(width/2, (height/2) - 50);
  //Text bellow the animation
  text("Working on updates", width/2, (height/2) + 20);
  text(x + "% complete", width/2, (height/2) + 50);
  text("Don't turn off your computer", width/2, (height/2) + 80);
  //Bottom text if needeed 
  //text("Don't turn off your computer, this will take a while", width/2, height - 64);
  //Controls
  if (keyPressed == true) {
    if (key == 'p') {
      pause = true;
    } else if (key == 'o') {
      pause = false;
    }
  }

  //The speed of the percentage change
  if (frameCount % 50 == 0) {
    updatePercent();
  }
}

void updatePercent() {
  if (!pause) {
    x+= int(random(1, 10));
    if (x > 100) {
      x = 0;
    }
  }
}

void keyPressed() {
  if (key == ESC) {
    key = 0;
  }
}
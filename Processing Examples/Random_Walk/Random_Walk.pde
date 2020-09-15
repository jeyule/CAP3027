// program driver

import controlP5.*;

Walker walker;

void setup() {
  size(800, 800);
  
  // create walker object
  walker = new Walker();
  background(138, 185, 207);
}

void draw() {
  walker.step();
  walker.render();
}

// program driver

import controlP5.*;

ControlP5 cp5;

Walker walker;

boolean running = false;

int iterations = 500000;
int counter = 0;
int stepCount = 500000;

void setup() {
  size(800, 800);

  background(138, 185, 207);
  
  cp5 = new ControlP5(this);
  
  // create start button
  cp5.addButton("START")
    .setPosition(50, 50)
    .setSize(80, 40);
}

void draw() {
  if (running) {
    
    int i = 0;
    while (i < stepCount) {
      walker.step();
      i++;
      
      counter++;
      
      // random walk for the set number of iterations
      if (counter > iterations) {
        running = false;
        counter = 0;
      }
    }
    
    walker.render();
    
    // reset for the next increment
    i = 0;
    walker.pointsX.clear();
    walker.pointsY.clear();
       
  }
}

public void START() {
  println("a button event from START");
  walker = new Walker();
  background(138, 185, 207);
  running = true;
}

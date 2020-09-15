// program driver

import controlP5.*;

ControlP5 cp5;

Walker walker;

boolean running = false;
boolean gradual = false;

//int iterations = 10000;
int counter = 0;
int stepRate = 100;
int stepCount = 0;

// default number of iterations
int iterations = 1000;

void setup() {
  size(800, 800);

  background(138, 185, 207);
  
  cp5 = new ControlP5(this);
  
  // create start button
  cp5.addButton("START")
    .setPosition(50, 50)
    .setSize(80, 40);
    
  // create the gradual step toggle
  cp5.addToggle("gradual")
    .setPosition(150, 50)
    .setSize(20, 20);
    
  // the iteration number slider
  cp5.addSlider("iterations")
    .setPosition(200, 50)
    .setRange(1000, 500000);
}

void draw() {  
  if (running) {

    if (gradual) {
      stepCount = stepRate;
    } else {
      stepCount = iterations - counter;
    }
    
    int i = 0;
    while (i < stepCount) {
      walker.step();
      i++;
      
      counter++;
  
      // random walk for the set number of iterations
      if (counter > iterations-1) {
        running = false;
        counter = 0;
        break;
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
  walker = new Walker();
  background(138, 185, 207);
  running = true;
}

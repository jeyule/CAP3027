// program driver

import controlP5.*;

ControlP5 cp5;

Walker walker;

boolean running = false;
boolean gradual = false;

int counter = 0;
int stepCount = 0;

// default number of iterations
int iterations = 1000;
//default step rate (steps per frame)
int stepRate = 1;

void setup() {
  size(800, 800);

  background(138, 185, 207);
  
  cp5 = new ControlP5(this);
  
  PFont font = createFont("Arial Narrow Bold", 20);
  
  // create start button
  cp5.addButton("START")
    .setPosition(30, 50)
    .setSize(80, 40)    
    .setFont(font);
    
  // create the gradual step toggle
  cp5.addToggle("gradual")
    .setPosition(120, 50)
    .setSize(20, 20)
    .setFont(font);
    
  // the iteration number slider
  cp5.addSlider("iterations")
    .setPosition(180, 50)
    .setSize(500, 40)
    .setRange(1000, 500000)
    .setFont(font);
    
  // the ste count slider
  cp5.addSlider("stepRate")
    .setPosition(180, 95)
    .setSize(500, 40)
    .setRange(1, 1000)
    .setFont(font);
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
